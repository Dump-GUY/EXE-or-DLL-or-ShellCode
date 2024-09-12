# PoC - EXE or DLL or ShellCode
This is just a simple silly PoC demonstrating executable "exe" file that can be used like exe, dll or shellcode...<br/>

## Steps
1. Create an "exe" which has no imports (not resolved when loading the exe as dll), no CRT, no GS, etc.<br/>
2. Embed a shellcode that pops "calc.exe" into ".text" section.<br/>
3. Create 1 exported function "test" that just executes the embedded shellcode.<br/>
3. Set the "main" function in exe as an entrypoint.<br/>
4. Function "main" only excutes the exported func "test".<br/>
5. Compile the exe as release build.<br/>
5. Create a polyglot DOS Header that is valid but also works as a 64-bit shellcode jumping to the first exported func of exe (raw offset) - nasm.<br/>
6. Compile the polyglot DOS/SC Header: `nasm.exe -f bin .\polyglot_DOS_shellcode_x64.asm -o .\polyglot_DOS_shellcode_x64.bin`<br/>
7. Replace the DOS header of compiled EXE with our compiled polyglot_DOS_shellcode_x64.bin (first 60 bytes).<br/>

This way we should have a valid exe, that can be loaded as DLL with callable exported func "test" and we also have a valid shellcode.<br/>

## Result
1. It can be executed as a normal app.<br/>
2. It can be loaded as dll and the export function "test" can be invoked.<br/>
3. It can be run via rundll32.exe.<br/>
4. It can be executed as a shellcode right from the beggining of DOS (MZ) header that works as sc polyglot stub.<br/><br/>

https://github.com/user-attachments/assets/f54fc0b7-ee8d-4d89-b8f1-489d249d77fb
