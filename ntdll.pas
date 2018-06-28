unit ntdll;

interface

implementation

Uses SysUtils, Windows;

Procedure PatchINT3;
Var NOP: Byte;
BytesWritten: DWORD;
NtDll: THandle;
P: Pointer;
begin
    If Win32Platform <> VER_PLATFORM_WIN32_NT Then
        Exit;
    NtDll := GetModuleHandle('NTDLL.DLL');
    If NtDll = 0 Then
        Exit;
    P := GetProcAddress(NtDll, 'DbgBreakPoint');
    If P = nil Then
        Exit;
    Try
        If Byte(P^) <> $CC Then
            Exit;
        NOP := $90;
        If WriteProcessMemory(GetCurrentProcess, P, @NOP, 1, BytesWritten) And
              (BytesWritten = 1) Then
            FlushInstructionCache(GetCurrentProcess, P, 1);
    Except
        On EAccessViolation Do
             ;
        Else
            Raise ;
    End;

End;

Initialization
    PatchINT3;

end.
