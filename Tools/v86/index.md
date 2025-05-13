---
layout: default
title: "Browser-based Linux VM (v86)"
---

# Browser-based Linux VM (v86)

This demo spins up a minimal Linux environment entirely in your browser using **v86**.

<!-- ──────────  prototype styles  ────────── -->
<style>
  /* container holding screen + toolbar */
  .vm-box{
      margin:2rem auto;
      width:80vw; max-width:1024px;
      border:1px solid #555;
      border-radius:6px;
      background:#111;
      box-shadow:0 4px 12px rgba(0,0,0,.35);
      display:flex; flex-direction:column;
  }

  /* the terminal / framebuffer area */
  #screen_container{
      position:relative;           /* so play/pause button can overlay */
      flex:1 1 auto;
      height:600px;
      background:#000;
      overflow:hidden;
  }
  #screen_container > div{
      width:100%; height:100%;
      color:#0f0; font:14px monospace; line-height:1.2;
      padding:.5rem;  box-sizing:border-box;
  }
  #screen_container > canvas{display:none;}

  /* toolbar at the bottom */
  #vm-toolbar{
      flex:0 0 auto;
      display:flex; flex-wrap:wrap; gap:.5rem;
      justify-content:center; align-items:center;
      padding:.75rem;
      background:#222;
      border-top:1px solid #555;
  }
  #vm-toolbar button, #vm-toolbar label{
      cursor:pointer;
      border:1px solid #666; border-radius:4px;
      background:#333; color:#eee;
      padding:.4rem .8rem; font-size:.9rem;
  }
  #vm-toolbar button:disabled{opacity:.4; cursor:default;}

  /* play/pause overlay in top-left corner of terminal */
  #btnToggle{
      position:absolute; top:.5rem; left:.5rem;
      z-index:10;
      padding:.2rem .4rem;
      font-size:1.1rem;
      background:#333; color:#eee;
      border:1px solid #666; border-radius:3px;
  }

  /* hide real file input behind label */
  .file-input{display:none;}
</style>

<!-- ──────────  VM container  ────────── -->
<div class="vm-box">
    <div id="screen_container">
        <!-- play / pause toggle overlay -->
        <button id="btnToggle">⏸️</button>
        <div style="white-space:pre;"></div>
        <canvas></canvas>
    </div>

    <!-- toolbar -->
    <div id="vm-toolbar">
        <button id="btnReset">🔄 Reset</button>
        <button id="btnCtrlAltDel">⌨️ Ctrl-Alt-Del</button>
        <button id="btnFullscreen">🖵 Fullscreen</button>

        <button id="btnSave">💾 Save&nbsp;State</button>

        <label>
            📂 Load&nbsp;State
            <input type="file" id="fileLoad" class="file-input" accept=".bin,.state">
        </label>

        <label>
            📁 Upload&nbsp;File
            <input type="file" id="fileUpload" class="file-input">
        </label>

        <input id="downloadPath" placeholder="/path/in/vm" style="width:140px" />
        <button id="btnDownload">⬇️ Download</button>
    </div>
</div>

<!-- ──────────  v86 runtime  ────────── -->
<script src="build/libv86.js"></script>

<script>
"use strict";

function qs(id){ return document.getElementById(id); }

window.addEventListener("load", () =>
{
    /* ─── initialise emulator ─── */
    const emulator = window.emulator = new V86({
        wasm_path: "build/v86.wasm",
        memory_size: 32 * 1024 * 1024,
        vga_memory_size: 2 * 1024 * 1024,
        screen_container: qs("screen_container"),
        bios:     { url: "bios/seabios.bin" },
        vga_bios: { url: "bios/vgabios.bin" },
        cdrom:    { url: "images/linux.iso" },
        autostart: true,
    });

    /* ─── helper: toggle play / pause button ─── */
    function updateToggleBtn(running){
        qs("btnToggle").textContent = running ? "⏸️" : "▶️";
    }

    /* pause / resume (top-left button) */
    qs("btnToggle").onclick = () =>
    {
        if(emulator.is_running){
            emulator.stop();
            updateToggleBtn(false);
        }else{
            emulator.run();
            updateToggleBtn(true);
        }
    };

    /* reset */
    qs("btnReset").onclick = () => emulator.restart();

    /* Ctrl-Alt-Del */
    qs("btnCtrlAltDel").onclick = () =>
    {
        /* send scancodes manually (works regardless of build) */
        emulator.keyboard_send_scancodes([0x1D,0x38,0x53, 0x9D,0xB8,0xD3]);
    };

    /* fullscreen */
    qs("btnFullscreen").onclick = () =>
    {
        const scr = emulator.screen_adapter;
        scr.is_full_screen() ? scr.exit_full_screen() : scr.make_full_screen();
    };

    /* save state */
    qs("btnSave").onclick = () =>
    {
        qs("btnSave").disabled = true;
        emulator.save_state((err, state) =>
        {
            qs("btnSave").disabled = false;
            if(err){ alert("Save failed"); return; }
            const blob = new Blob([ state ], { type:"application/octet-stream" });
            const url  = URL.createObjectURL(blob);
            const a    = document.createElement("a");
            a.href = url; a.download = "v86_state.bin";
            a.click();
            URL.revokeObjectURL(url);
        });
    };

    /* load state */
    qs("fileLoad").onchange = (e) =>
    {
        const f = e.target.files[0];
        if(!f) return;
        const reader = new FileReader();
        reader.onload = ev =>
        {
            emulator.restore_state(ev.target.result, err =>
            {
                if(err) alert("Restore failed");
            });
        };
        reader.readAsArrayBuffer(f);
        e.target.value = "";          // reset input
    };

    /* upload file into VM root (or /root) */
    qs("fileUpload").onchange = (e) =>
    {
        const f = e.target.files[0];
        if(!f) return;
        const reader = new FileReader();
        reader.onload = ev =>
        {
            const path = "/" + f.name;
            emulator.create_file(path, new Uint8Array(ev.target.result));
            alert("Uploaded to " + path);
        };
        reader.readAsArrayBuffer(f);
        e.target.value = "";
    };

    /* download file from VM */
    qs("btnDownload").onclick = () =>
    {
        const path = qs("downloadPath").value.trim();
        if(!path){ alert("Enter path first"); return; }
        try{
            const data = emulator.read_file(path);
            const blob = new Blob([ data ], { type:"application/octet-stream" });
            const url  = URL.createObjectURL(blob);
            const a    = document.createElement("a");
            a.href = url; a.download = path.split("/").pop() || "vm_file";
            a.click();
            URL.revokeObjectURL(url);
        }catch(e){
            alert("Unable to read file: " + e.message);
        }
    };

    /* enable download button when path entered */
    qs("downloadPath").addEventListener("input", e =>
    {
        qs("btnDownload").disabled = e.target.value.trim() === "";
    });

    updateToggleBtn(true);   // initial state
});
</script>
