Content-Type: multipart/mixed; boundary="===============7250064437504298621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Wed, 11 May 2022 13:02:41 +0800
Message-ID: <202205111251.wBKtHLFV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7250064437504298621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alex Shi <alexs@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   8 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 weeks ago
config: mips-randconfig-c004-20220508 (https://download.01.org/0day-ci/arch=
ive/20220511/202205111251.wBKtHLFV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~
   crypto/skcipher.c:210:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:210:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(walk->oiv, walk->iv, walk->ivsize);
                   ^~~~~~
   crypto/skcipher.c:292:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp, walk->src.virt.addr, walk->nbytes);
           ^~~~~~
   crypto/skcipher.c:292:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(tmp, walk->src.virt.addr, walk->nbytes);
           ^~~~~~
   crypto/skcipher.c:428:13: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           walk->iv =3D memcpy(iv, walk->iv, walk->ivsize);
                      ^~~~~~
   crypto/skcipher.c:428:13: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           walk->iv =3D memcpy(iv, walk->iv, walk->ivsize);
                      ^~~~~~
   crypto/skcipher.c:588:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   crypto/skcipher.c:588:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(alignbuffer, key, keylen);
           ^~~~~~
   Suppressed 59 warnings (59 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   fs/proc/thread_self.c:25:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security=
.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           sprintf(name, "%u/task/%u", tgid, pid);
           ^~~~~~~
   fs/proc/thread_self.c:25:2: note: Call to function 'sprintf' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'sprintf_s' in case of C11
           sprintf(name, "%u/task/%u", tgid, pid);
           ^~~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   fs/proc/vmcore.c:154:5: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memset(buf, 0, nr_bytes);
                                   ^~~~~~
   fs/proc/vmcore.c:154:5: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
                                   memset(buf, 0, nr_bytes);
                                   ^~~~~~
   fs/proc/vmcore.c:244:3: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(target, src, size);
                   ^~~~~~
   fs/proc/vmcore.c:244:3: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
                   memcpy(target, src, size);
                   ^~~~~~
   fs/proc/vmcore.c:901:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp, &phdr, sizeof(phdr));
           ^~~~~~
   fs/proc/vmcore.c:901:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(tmp, &phdr, sizeof(phdr));
           ^~~~~~
   fs/proc/vmcore.c:907:2: warning: Call to function 'memmove' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(tmp, tmp+i, ((*elfsz)-sizeof(Elf64_Ehdr)-sizeof(Elf64_Ph=
dr)));
           ^~~~~~~
   fs/proc/vmcore.c:907:2: note: Call to function 'memmove' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memmove_s' in case of C11
           memmove(tmp, tmp+i, ((*elfsz)-sizeof(Elf64_Ehdr)-sizeof(Elf64_Ph=
dr)));
           ^~~~~~~
   fs/proc/vmcore.c:908:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(elfptr + *elfsz, 0, i);
           ^~~~~~
   fs/proc/vmcore.c:908:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(elfptr + *elfsz, 0, i);
           ^~~~~~
   fs/proc/vmcore.c:1092:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(tmp, &phdr, sizeof(phdr));
           ^~~~~~
   fs/proc/vmcore.c:1092:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(tmp, &phdr, sizeof(phdr));
           ^~~~~~
   fs/proc/vmcore.c:1098:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(tmp, tmp+i, ((*elfsz)-sizeof(Elf32_Ehdr)-sizeof(Elf32_Ph=
dr)));
           ^~~~~~~
   fs/proc/vmcore.c:1098:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(tmp, tmp+i, ((*elfsz)-sizeof(Elf32_Ehdr)-sizeof(Elf32_Ph=
dr)));
           ^~~~~~~
   fs/proc/vmcore.c:1099:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(elfptr + *elfsz, 0, i);
           ^~~~~~
   fs/proc/vmcore.c:1099:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(elfptr + *elfsz, 0, i);
           ^~~~~~
   fs/proc/vmcore.c:1390:2: warning: Call to function 'strncpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy((char *)vdd_hdr->name, VMCOREDD_NOTE_NAME,
           ^~~~~~~
   fs/proc/vmcore.c:1390:2: note: Call to function 'strncpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'strncpy_s' in case of C11
           strncpy((char *)vdd_hdr->name, VMCOREDD_NOTE_NAME,
           ^~~~~~~
   fs/proc/vmcore.c:1392:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(vdd_hdr->dump_name, data->dump_name, sizeof(vdd_hdr->dump=
_name));
           ^~~~~~
   fs/proc/vmcore.c:1392:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(vdd_hdr->dump_name, data->dump_name, sizeof(vdd_hdr->dump=
_name));
           ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:61:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/mips/kernel/crash_dump.c:29:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   arch/mips/kernel/crash_dump.c:29:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   81 warnings generated.
   kernel/bpf/core.c:237:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(fp, fp_old, fp_old->pages * PAGE_SIZE);
                   ^~~~~~
   kernel/bpf/core.c:237:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(fp, fp_old, fp_old->pages * PAGE_SIZE);
                   ^~~~~~
   kernel/bpf/core.c:284:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ws, 0, sizeof(ws));
           ^~~~~~
   kernel/bpf/core.c:284:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(ws, 0, sizeof(ws));
           ^~~~~~
   kernel/bpf/core.c:311:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&raw[psize], 0, raw_size - psize);
           ^~~~~~
   kernel/bpf/core.c:311:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&raw[psize], 0, raw_size - psize);
           ^~~~~~
   kernel/bpf/core.c:333:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:333:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(fp->tag, result, sizeof(fp->tag));
           ^~~~~~
   kernel/bpf/core.c:452:3: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:452:3: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
                   memcpy(prog->insnsi + off, patch, sizeof(*patch));
                   ^~~~~~
   kernel/bpf/core.c:488:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:488:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog_adj->insnsi + off + len, prog_adj->insnsi + off + 1,
           ^~~~~~~
   kernel/bpf/core.c:490:2: warning: Call to function 'memcpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:490:2: note: Call to function 'memcpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memcpy_s' in case of C11
           memcpy(prog_adj->insnsi + off, patch, sizeof(*patch) * len);
           ^~~~~~
   kernel/bpf/core.c:508:2: warning: Call to function 'memmove' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memmove_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:508:2: note: Call to function 'memmove' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memmove_s' in case of C11
           memmove(prog->insnsi + off, prog->insnsi + off + cnt,
           ^~~~~~~
   kernel/bpf/core.c:1370:2: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(dst, 0, size);
           ^~~~~~
   kernel/bpf/core.c:1370:2: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
           memset(dst, 0, size);
           ^~~~~~
   Suppressed 72 warnings (71 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   crypto/chacha20poly1305.c:89:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, &leicb, sizeof(leicb));
           ^~~~~~
   crypto/chacha20poly1305.c:89:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, &leicb, sizeof(leicb));
--
           ^~~~~~~~
   include/linux/bitops.h:155:10: note: Returning from 'fls'
                   return fls(l);
                          ^~~~~~
   include/linux/bitops.h:155:3: note: Returning the value 32
                   return fls(l);
                   ^~~~~~~~~~~~~
   include/linux/log2.h:57:16: note: Returning from 'fls_long'
           return 1UL << fls_long(n - 1);
                         ^~~~~~~~~~~~~~~
   include/linux/log2.h:57:13: note: The result of the left shift is undefi=
ned due to shifting by '32', which is greater or equal to the width of type=
 'unsigned long'
           return 1UL << fls_long(n - 1);
                      ^  ~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: warning: The result of the left shift is und=
efined due to shifting by '4294967295', which is greater or equal to the wi=
dth of type 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorRes=
ult]
           return 1UL << (fls_long(n) - 1);
                      ^
   lib/kfifo.c:71:2: note: Taking true branch
           if (!is_power_of_2(size))
           ^
   lib/kfifo.c:72:10: note: '?' condition is false
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:193:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __builtin_constant_p(n) ? (             \
           ^
   lib/kfifo.c:72:10: note: Calling '__rounddown_pow_of_two'
                   size =3D rounddown_pow_of_two(size);
                          ^
   include/linux/log2.h:195:2: note: expanded from macro 'rounddown_pow_of_=
two'
           __rounddown_pow_of_two(n)               \
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/log2.h:67:13: note: The result of the left shift is undefi=
ned due to shifting by '4294967295', which is greater or equal to the width=
 of type 'unsigned long'
           return 1UL << (fls_long(n) - 1);
                      ^  ~~~~~~~~~~~~~~~~~
   lib/kfifo.c:104:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(fifo->data + off, src, l);
           ^~~~~~
   lib/kfifo.c:104:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(fifo->data + off, src, l);
           ^~~~~~
   lib/kfifo.c:105:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(fifo->data, src + l, len - l);
           ^~~~~~
   lib/kfifo.c:105:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(fifo->data, src + l, len - l);
           ^~~~~~
   lib/kfifo.c:143:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:143:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst, fifo->data + off, l);
           ^~~~~~
   lib/kfifo.c:144:2: warning: Call to function 'memcpy' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecureAP=
I.DeprecatedOrUnsafeBufferHandling]
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   lib/kfifo.c:144:2: note: Call to function 'memcpy' is insecure as it doe=
s not provide security checks introduced in the C11 standard. Replace with =
analogous functions that support length arguments or provides boundary chec=
ks such as 'memcpy_s' in case of C11
           memcpy(dst + l, fifo->data, len - l);
           ^~~~~~
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   38 warnings generated.
   crypto/wp512.c:993:2: warning: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecur=
eAPI.DeprecatedOrUnsafeBufferHandling]
           memset(wctx->bitLength, 0, 32);
           ^~~~~~
   crypto/wp512.c:993:2: note: Call to function 'memset' is insecure as it =
does not provide security checks introduced in the C11 standard. Replace wi=
th analogous functions that support length arguments or provides boundary c=
hecks such as 'memset_s' in case of C11
           memset(wctx->bitLength, 0, 32);
           ^~~~~~
   crypto/wp512.c:1079:4: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&buffer[bufferPos], 0, WP512_BLOCK_SIZE -=
 bufferPos);
                           ^~~~~~
   crypto/wp512.c:1079:4: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                           memset(&buffer[bufferPos], 0, WP512_BLOCK_SIZE -=
 bufferPos);
                           ^~~~~~
   crypto/wp512.c:1084:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&buffer[bufferPos], 0,
                   ^~~~~~
   crypto/wp512.c:1084:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(&buffer[bufferPos], 0,
                   ^~~~~~
   crypto/wp512.c:1087:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&buffer[WP512_BLOCK_SIZE - WP512_LENGTHBYTES],
           ^~~~~~
   crypto/wp512.c:1087:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&buffer[WP512_BLOCK_SIZE - WP512_LENGTHBYTES],
           ^~~~~~
   crypto/wp512.c:1103:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^~~~~~
   crypto/wp512.c:1103:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(out, D, WP384_DIGEST_SIZE);
           ^~~~~~
   crypto/wp512.c:1114:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, D, WP256_DIGEST_SIZE);
           ^~~~~~
   crypto/wp512.c:1114:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(out, D, WP256_DIGEST_SIZE);
           ^~~~~~
   Suppressed 32 warnings (32 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is ins=
ecure as it does not provide bounding of the memory buffer or security chec=
ks introduced in the C11 standard. Replace with analogous functions that su=
pport length arguments or provides boundary checks such as 'sprintf_s' in c=
ase of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHan=
dling]
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:61:2: note: Call to function 'sprintf' is insecu=
re as it does not provide bounding of the memory buffer or security checks =
introduced in the C11 standard. Replace with analogous functions that suppo=
rt length arguments or provides boundary checks such as 'sprintf_s' in case=
 of C11
           sprintf(fmt, "cpu model\t\t: %%s V%%d.%%d%s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: warning: Call to function 'sprintf' is in=
secure as it does not provide bounding of the memory buffer or security che=
cks introduced in the C11 standard. Replace with analogous functions that s=
upport length arguments or provides boundary checks such as 'sprintf_s' in =
case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHa=
ndling]
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   arch/mips/kernel/proc.c:296:2: note: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11
           sprintf(fmt, "VCE%%c exceptions\t\t: %s\n",
           ^~~~~~~
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   40 warnings generated.
   arch/mips/kernel/crash_dump.c:29:3: warning: Call to function 'memcpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-se=
curity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   arch/mips/kernel/crash_dump.c:29:3: note: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11
                   memcpy(buf, vaddr + offset, csize);
                   ^~~~~~
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   49 warnings generated.
   crypto/chacha20poly1305.c:89:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv, &leicb, sizeof(leicb));
           ^~~~~~
   crypto/chacha20poly1305.c:89:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv, &leicb, sizeof(leicb));
           ^~~~~~
   crypto/chacha20poly1305.c:90:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + sizeof(leicb), ctx->salt, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:90:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv + sizeof(leicb), ctx->salt, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:91:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(iv + sizeof(leicb) + ctx->saltlen, req->iv,
           ^~~~~~
   crypto/chacha20poly1305.c:91:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(iv + sizeof(leicb) + ctx->saltlen, req->iv,
           ^~~~~~
   crypto/chacha20poly1305.c:208:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:208:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:267:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:267:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(preq->pad, 0, sizeof(preq->pad));
           ^~~~~~
   crypto/chacha20poly1305.c:376:2: warning: Call to function 'memset' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memset_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx->key, 0, sizeof(rctx->key));
           ^~~~~~
   crypto/chacha20poly1305.c:376:2: note: Call to function 'memset' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memset_s' in case of C11
           memset(rctx->key, 0, sizeof(rctx->key));
           ^~~~~~
   crypto/chacha20poly1305.c:483:2: warning: Call to function 'memcpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-secur=
ity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ctx->salt, key + keylen, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:483:2: note: Call to function 'memcpy' is inse=
cure as it does not provide security checks introduced in the C11 standard.=
 Replace with analogous functions that support length arguments or provides=
 boundary checks such as 'memcpy_s' in case of C11
           memcpy(ctx->salt, key + keylen, ctx->saltlen);
           ^~~~~~
   crypto/chacha20poly1305.c:601:6: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:601:6: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:605:6: warning: Call to function 'snprintf' is=
 insecure as it does not provide security checks introduced in the C11 stan=
dard. Replace with analogous functions that support length arguments or pro=
vides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   crypto/chacha20poly1305.c:605:6: note: Call to function 'snprintf' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'snprintf_s' in case of C11
           if (snprintf(inst->alg.base.cra_driver_name, CRYPTO_MAX_ALG_NAME,
               ^~~~~~~~
   Suppressed 40 warnings (40 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   30 warnings generated.
   Suppressed 30 warnings (30 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +61 arch/mips/kernel/proc.c

^1da177e4c3f41 Linus Torvalds      2005-04-16   49  =

^1da177e4c3f41 Linus Torvalds      2005-04-16   50  	/*
^1da177e4c3f41 Linus Torvalds      2005-04-16   51  	 * For the first proce=
ssor also print the system type
^1da177e4c3f41 Linus Torvalds      2005-04-16   52  	 */
487d70d0b8bd1c Gabor Juhos         2010-11-23   53  	if (n =3D=3D 0) {
^1da177e4c3f41 Linus Torvalds      2005-04-16   54  		seq_printf(m, "system=
 type\t\t: %s\n", get_system_type());
487d70d0b8bd1c Gabor Juhos         2010-11-23   55  		if (mips_get_machine_=
name())
487d70d0b8bd1c Gabor Juhos         2010-11-23   56  			seq_printf(m, "machi=
ne\t\t\t: %s\n",
487d70d0b8bd1c Gabor Juhos         2010-11-23   57  				   mips_get_machine=
_name());
487d70d0b8bd1c Gabor Juhos         2010-11-23   58  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16   59  =

^1da177e4c3f41 Linus Torvalds      2005-04-16   60  	seq_printf(m, "process=
or\t\t: %ld\n", n);
^1da177e4c3f41 Linus Torvalds      2005-04-16  @61  	sprintf(fmt, "cpu mode=
l\t\t: %%s V%%d.%%d%s\n",
e04582b7bc70b4 Atsushi Nemoto      2006-10-09   62  		      cpu_data[n].opt=
ions & MIPS_CPU_FPU ? "  FPU V%d.%d" : "");
e47c659b55aff7 Johannes Dickgreber 2008-10-13   63  	seq_printf(m, fmt, __c=
pu_name[n],
^1da177e4c3f41 Linus Torvalds      2005-04-16   64  		      (version >> 4) =
& 0x0f, version & 0x0f,
^1da177e4c3f41 Linus Torvalds      2005-04-16   65  		      (fp_vers >> 4) =
& 0x0f, fp_vers & 0x0f);
5636919b5c909f Ralf Baechle        2009-02-28   66  	seq_printf(m, "BogoMIP=
S\t\t: %u.%02u\n",
0ac354801a8791 Ralf Baechle        2005-02-21   67  		      cpu_data[n].ude=
lay_val / (500000/HZ),
0ac354801a8791 Ralf Baechle        2005-02-21   68  		      (cpu_data[n].ud=
elay_val / (5000/HZ)) % 100);
^1da177e4c3f41 Linus Torvalds      2005-04-16   69  	seq_printf(m, "wait in=
struction\t: %s\n", cpu_wait ? "yes" : "no");
^1da177e4c3f41 Linus Torvalds      2005-04-16   70  	seq_printf(m, "microse=
cond timers\t: %s\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16   71  		      cpu_has_counter=
 ? "yes" : "no");
31aa36658a1232 Karl-Johan Karlsson 2006-10-08   72  	seq_printf(m, "tlb_ent=
ries\t\t: %d\n", cpu_data[n].tlbsize);
^1da177e4c3f41 Linus Torvalds      2005-04-16   73  	seq_printf(m, "extra i=
nterrupt vector\t: %s\n",
^1da177e4c3f41 Linus Torvalds      2005-04-16   74  		      cpu_has_divec ?=
 "yes" : "no");
654f57bfb46799 David Daney         2008-09-23   75  	seq_printf(m, "hardwar=
e watchpoint\t: %s",
654f57bfb46799 David Daney         2008-09-23   76  		      cpu_has_watch ?=
 "yes, " : "no\n");
654f57bfb46799 David Daney         2008-09-23   77  	if (cpu_has_watch) {
654f57bfb46799 David Daney         2008-09-23   78  		seq_printf(m, "count:=
 %d, address/irw mask: [",
654f57bfb46799 David Daney         2008-09-23   79  		      cpu_data[n].wat=
ch_reg_count);
654f57bfb46799 David Daney         2008-09-23   80  		for (i =3D 0; i < cpu=
_data[n].watch_reg_count; i++)
654f57bfb46799 David Daney         2008-09-23   81  			seq_printf(m, "%s0x%=
04x", i ? ", " : "",
654f57bfb46799 David Daney         2008-09-23   82  				cpu_data[n].watch_r=
eg_masks[i]);
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   83  		seq_puts(m, "]\n");
654f57bfb46799 David Daney         2008-09-23   84  	}
41315b6ec108e9 Aaro Koskinen       2013-12-31   85  =

1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   86  	seq_puts(m, "isa\t\t\t=
:");
e5f5a5b06e51a3 Maciej W. Rozycki   2017-07-08   87  	if (cpu_has_mips_1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   88  		seq_puts(m, " mips1");
a96102be700f87 Steven J. Hill      2012-12-07   89  	if (cpu_has_mips_2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   90  		seq_puts(m, " mips2");
a96102be700f87 Steven J. Hill      2012-12-07   91  	if (cpu_has_mips_3)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   92  		seq_puts(m, " mips3");
a96102be700f87 Steven J. Hill      2012-12-07   93  	if (cpu_has_mips_4)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   94  		seq_puts(m, " mips4");
a96102be700f87 Steven J. Hill      2012-12-07   95  	if (cpu_has_mips_5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   96  		seq_puts(m, " mips5");
a96102be700f87 Steven J. Hill      2012-12-07   97  	if (cpu_has_mips32r1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13   98  		seq_puts(m, " mips32r=
1");
a96102be700f87 Steven J. Hill      2012-12-07   99  	if (cpu_has_mips32r2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  100  		seq_puts(m, " mips32r=
2");
ab7c01fdc3cfe0 Serge Semin         2020-05-21  101  	if (cpu_has_mips32r5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  102  		seq_puts(m, " mips32r=
5");
515a6393dbac4f Markos Chandras     2014-11-14  103  	if (cpu_has_mips32r6)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  104  		seq_puts(m, " mips32r=
6");
a96102be700f87 Steven J. Hill      2012-12-07  105  	if (cpu_has_mips64r1)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  106  		seq_puts(m, " mips64r=
1");
a96102be700f87 Steven J. Hill      2012-12-07  107  	if (cpu_has_mips64r2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  108  		seq_puts(m, " mips64r=
2");
ab7c01fdc3cfe0 Serge Semin         2020-05-21  109  	if (cpu_has_mips64r5)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  110  		seq_puts(m, " mips64r=
5");
515a6393dbac4f Markos Chandras     2014-11-14  111  	if (cpu_has_mips64r6)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  112  		seq_puts(m, " mips64r=
6");
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  113  	seq_puts(m, "\n");
981ef0de49869c Ralf Baechle        2012-08-20  114  =

1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  115  	seq_puts(m, "ASEs impl=
emented\t:");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  116  	if (cpu_has_mips16)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  117  		seq_puts(m, " mips16"=
);
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  118  	if (cpu_has_mips16e2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  119  		seq_puts(m, " mips16e=
2");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  120  	if (cpu_has_mdmx)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  121  		seq_puts(m, " mdmx");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  122  	if (cpu_has_mips3d)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  123  		seq_puts(m, " mips3d"=
);
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  124  	if (cpu_has_smartmips)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  125  		seq_puts(m, " smartmi=
ps");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  126  	if (cpu_has_dsp)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  127  		seq_puts(m, " dsp");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  128  	if (cpu_has_dsp2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  129  		seq_puts(m, " dsp2");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  130  	if (cpu_has_dsp3)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  131  		seq_puts(m, " dsp3");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  132  	if (cpu_has_mipsmt)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  133  		seq_puts(m, " mt");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  134  	if (cpu_has_mmips)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  135  		seq_puts(m, " micromi=
ps");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  136  	if (cpu_has_vz)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  137  		seq_puts(m, " vz");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  138  	if (cpu_has_msa)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  139  		seq_puts(m, " msa");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  140  	if (cpu_has_eva)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  141  		seq_puts(m, " eva");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  142  	if (cpu_has_htw)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  143  		seq_puts(m, " htw");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  144  	if (cpu_has_xpa)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  145  		seq_puts(m, " xpa");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  146  	if (cpu_has_loongson_m=
mi)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  147  		seq_puts(m, " loongso=
n-mmi");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  148  	if (cpu_has_loongson_c=
am)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  149  		seq_puts(m, " loongso=
n-cam");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  150  	if (cpu_has_loongson_e=
xt)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  151  		seq_puts(m, " loongso=
n-ext");
01fde9a0e497c7 Ilya Lipnitskiy     2021-10-13  152  	if (cpu_has_loongson_e=
xt2)
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  153  		seq_puts(m, " loongso=
n-ext2");
1ad964ae1a9150 Ilya Lipnitskiy     2021-10-13  154  	seq_puts(m, "\n");
981ef0de49869c Ralf Baechle        2012-08-20  155  =

bce860833ab1e4 Steven J. Hill      2013-03-25  156  	if (cpu_has_mmips) {
bce860833ab1e4 Steven J. Hill      2013-03-25  157  		seq_printf(m, "microm=
ips kernel\t: %s\n",
bce860833ab1e4 Steven J. Hill      2013-03-25  158  		      (read_c0_config=
3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
bce860833ab1e4 Steven J. Hill      2013-03-25  159  	}
626bfa03729959 Hauke Mehrtens      2021-10-13  160  =

626bfa03729959 Hauke Mehrtens      2021-10-13  161  	seq_puts(m, "Options i=
mplemented\t:");
626bfa03729959 Hauke Mehrtens      2021-10-13  162  	if (cpu_has_tlb)
626bfa03729959 Hauke Mehrtens      2021-10-13  163  		seq_puts(m, " tlb");
626bfa03729959 Hauke Mehrtens      2021-10-13  164  	if (cpu_has_ftlb)
626bfa03729959 Hauke Mehrtens      2021-10-13  165  		seq_puts(m, " ftlb");
626bfa03729959 Hauke Mehrtens      2021-10-13  166  	if (cpu_has_tlbinv)
626bfa03729959 Hauke Mehrtens      2021-10-13  167  		seq_puts(m, " tlbinv"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  168  	if (cpu_has_segments)
626bfa03729959 Hauke Mehrtens      2021-10-13  169  		seq_puts(m, " segment=
s");
626bfa03729959 Hauke Mehrtens      2021-10-13  170  	if (cpu_has_rixiex)
626bfa03729959 Hauke Mehrtens      2021-10-13  171  		seq_puts(m, " rixiex"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  172  	if (cpu_has_ldpte)
626bfa03729959 Hauke Mehrtens      2021-10-13  173  		seq_puts(m, " ldpte");
626bfa03729959 Hauke Mehrtens      2021-10-13  174  	if (cpu_has_maar)
626bfa03729959 Hauke Mehrtens      2021-10-13  175  		seq_puts(m, " maar");
626bfa03729959 Hauke Mehrtens      2021-10-13  176  	if (cpu_has_rw_llb)
626bfa03729959 Hauke Mehrtens      2021-10-13  177  		seq_puts(m, " rw_llb"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  178  	if (cpu_has_4kex)
626bfa03729959 Hauke Mehrtens      2021-10-13  179  		seq_puts(m, " 4kex");
626bfa03729959 Hauke Mehrtens      2021-10-13  180  	if (cpu_has_3k_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  181  		seq_puts(m, " 3k_cach=
e");
626bfa03729959 Hauke Mehrtens      2021-10-13  182  	if (cpu_has_4k_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  183  		seq_puts(m, " 4k_cach=
e");
626bfa03729959 Hauke Mehrtens      2021-10-13  184  	if (cpu_has_tx39_cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  185  		seq_puts(m, " tx39_ca=
che");
626bfa03729959 Hauke Mehrtens      2021-10-13  186  	if (cpu_has_octeon_cac=
he)
626bfa03729959 Hauke Mehrtens      2021-10-13  187  		seq_puts(m, " octeon_=
cache");
1cab5bd69eb1f9 Tiezhu Yang         2021-11-25  188  	if (raw_cpu_has_fpu)
626bfa03729959 Hauke Mehrtens      2021-10-13  189  		seq_puts(m, " fpu");
626bfa03729959 Hauke Mehrtens      2021-10-13  190  	if (cpu_has_32fpr)
626bfa03729959 Hauke Mehrtens      2021-10-13  191  		seq_puts(m, " 32fpr");
626bfa03729959 Hauke Mehrtens      2021-10-13  192  	if (cpu_has_cache_cdex=
_p)
626bfa03729959 Hauke Mehrtens      2021-10-13  193  		seq_puts(m, " cache_c=
dex_p");
626bfa03729959 Hauke Mehrtens      2021-10-13  194  	if (cpu_has_cache_cdex=
_s)
626bfa03729959 Hauke Mehrtens      2021-10-13  195  		seq_puts(m, " cache_c=
dex_s");
626bfa03729959 Hauke Mehrtens      2021-10-13  196  	if (cpu_has_prefetch)
626bfa03729959 Hauke Mehrtens      2021-10-13  197  		seq_puts(m, " prefetc=
h");
626bfa03729959 Hauke Mehrtens      2021-10-13  198  	if (cpu_has_mcheck)
626bfa03729959 Hauke Mehrtens      2021-10-13  199  		seq_puts(m, " mcheck"=
);
626bfa03729959 Hauke Mehrtens      2021-10-13  200  	if (cpu_has_ejtag)
626bfa03729959 Hauke Mehrtens      2021-10-13  201  		seq_puts(m, " ejtag");
626bfa03729959 Hauke Mehrtens      2021-10-13  202  	if (cpu_has_llsc)
626bfa03729959 Hauke Mehrtens      2021-10-13  203  		seq_puts(m, " llsc");
626bfa03729959 Hauke Mehrtens      2021-10-13  204  	if (cpu_has_guestctl0e=
xt)
626bfa03729959 Hauke Mehrtens      2021-10-13  205  		seq_puts(m, " guestct=
l0ext");
626bfa03729959 Hauke Mehrtens      2021-10-13  206  	if (cpu_has_guestctl1)
626bfa03729959 Hauke Mehrtens      2021-10-13  207  		seq_puts(m, " guestct=
l1");
626bfa03729959 Hauke Mehrtens      2021-10-13  208  	if (cpu_has_guestctl2)
626bfa03729959 Hauke Mehrtens      2021-10-13  209  		seq_puts(m, " guestct=
l2");
626bfa03729959 Hauke Mehrtens      2021-10-13  210  	if (cpu_has_guestid)
626bfa03729959 Hauke Mehrtens      2021-10-13  211  		seq_puts(m, " guestid=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  212  	if (cpu_has_drg)
626bfa03729959 Hauke Mehrtens      2021-10-13  213  		seq_puts(m, " drg");
626bfa03729959 Hauke Mehrtens      2021-10-13  214  	if (cpu_has_rixi)
626bfa03729959 Hauke Mehrtens      2021-10-13  215  		seq_puts(m, " rixi");
626bfa03729959 Hauke Mehrtens      2021-10-13  216  	if (cpu_has_lpa)
626bfa03729959 Hauke Mehrtens      2021-10-13  217  		seq_puts(m, " lpa");
626bfa03729959 Hauke Mehrtens      2021-10-13  218  	if (cpu_has_mvh)
626bfa03729959 Hauke Mehrtens      2021-10-13  219  		seq_puts(m, " mvh");
626bfa03729959 Hauke Mehrtens      2021-10-13  220  	if (cpu_has_vtag_icach=
e)
626bfa03729959 Hauke Mehrtens      2021-10-13  221  		seq_puts(m, " vtag_ic=
ache");
626bfa03729959 Hauke Mehrtens      2021-10-13  222  	if (cpu_has_dc_aliases)
626bfa03729959 Hauke Mehrtens      2021-10-13  223  		seq_puts(m, " dc_alia=
ses");
626bfa03729959 Hauke Mehrtens      2021-10-13  224  	if (cpu_has_ic_fills_f=
_dc)
626bfa03729959 Hauke Mehrtens      2021-10-13  225  		seq_puts(m, " ic_fill=
s_f_dc");
626bfa03729959 Hauke Mehrtens      2021-10-13  226  	if (cpu_has_pindexed_d=
cache)
626bfa03729959 Hauke Mehrtens      2021-10-13  227  		seq_puts(m, " pindexe=
d_dcache");
626bfa03729959 Hauke Mehrtens      2021-10-13  228  	if (cpu_has_userlocal)
626bfa03729959 Hauke Mehrtens      2021-10-13  229  		seq_puts(m, " userloc=
al");
626bfa03729959 Hauke Mehrtens      2021-10-13  230  	if (cpu_has_nofpuex)
626bfa03729959 Hauke Mehrtens      2021-10-13  231  		seq_puts(m, " nofpuex=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  232  	if (cpu_has_vint)
626bfa03729959 Hauke Mehrtens      2021-10-13  233  		seq_puts(m, " vint");
626bfa03729959 Hauke Mehrtens      2021-10-13  234  	if (cpu_has_veic)
626bfa03729959 Hauke Mehrtens      2021-10-13  235  		seq_puts(m, " veic");
626bfa03729959 Hauke Mehrtens      2021-10-13  236  	if (cpu_has_inclusive_=
pcaches)
626bfa03729959 Hauke Mehrtens      2021-10-13  237  		seq_puts(m, " inclusi=
ve_pcaches");
626bfa03729959 Hauke Mehrtens      2021-10-13  238  	if (cpu_has_perf_cntr_=
intr_bit)
626bfa03729959 Hauke Mehrtens      2021-10-13  239  		seq_puts(m, " perf_cn=
tr_intr_bit");
626bfa03729959 Hauke Mehrtens      2021-10-13  240  	if (cpu_has_ufr)
626bfa03729959 Hauke Mehrtens      2021-10-13  241  		seq_puts(m, " ufr");
626bfa03729959 Hauke Mehrtens      2021-10-13  242  	if (cpu_has_fre)
626bfa03729959 Hauke Mehrtens      2021-10-13  243  		seq_puts(m, " fre");
626bfa03729959 Hauke Mehrtens      2021-10-13  244  	if (cpu_has_cdmm)
626bfa03729959 Hauke Mehrtens      2021-10-13  245  		seq_puts(m, " cdmm");
626bfa03729959 Hauke Mehrtens      2021-10-13  246  	if (cpu_has_small_page=
s)
626bfa03729959 Hauke Mehrtens      2021-10-13  247  		seq_puts(m, " small_p=
ages");
626bfa03729959 Hauke Mehrtens      2021-10-13  248  	if (cpu_has_nan_legacy)
626bfa03729959 Hauke Mehrtens      2021-10-13  249  		seq_puts(m, " nan_leg=
acy");
626bfa03729959 Hauke Mehrtens      2021-10-13  250  	if (cpu_has_nan_2008)
626bfa03729959 Hauke Mehrtens      2021-10-13  251  		seq_puts(m, " nan_200=
8");
626bfa03729959 Hauke Mehrtens      2021-10-13  252  	if (cpu_has_ebase_wg)
626bfa03729959 Hauke Mehrtens      2021-10-13  253  		seq_puts(m, " ebase_w=
g");
626bfa03729959 Hauke Mehrtens      2021-10-13  254  	if (cpu_has_badinstr)
626bfa03729959 Hauke Mehrtens      2021-10-13  255  		seq_puts(m, " badinst=
r");
626bfa03729959 Hauke Mehrtens      2021-10-13  256  	if (cpu_has_badinstrp)
626bfa03729959 Hauke Mehrtens      2021-10-13  257  		seq_puts(m, " badinst=
rp");
626bfa03729959 Hauke Mehrtens      2021-10-13  258  	if (cpu_has_contextcon=
fig)
626bfa03729959 Hauke Mehrtens      2021-10-13  259  		seq_puts(m, " context=
config");
626bfa03729959 Hauke Mehrtens      2021-10-13  260  	if (cpu_has_perf)
626bfa03729959 Hauke Mehrtens      2021-10-13  261  		seq_puts(m, " perf");
626bfa03729959 Hauke Mehrtens      2021-10-13  262  	if (cpu_has_mac2008_on=
ly)
626bfa03729959 Hauke Mehrtens      2021-10-13  263  		seq_puts(m, " mac2008=
_only");
626bfa03729959 Hauke Mehrtens      2021-10-13  264  	if (cpu_has_ftlbparex)
626bfa03729959 Hauke Mehrtens      2021-10-13  265  		seq_puts(m, " ftlbpar=
ex");
626bfa03729959 Hauke Mehrtens      2021-10-13  266  	if (cpu_has_gsexcex)
626bfa03729959 Hauke Mehrtens      2021-10-13  267  		seq_puts(m, " gsexcex=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  268  	if (cpu_has_shared_ftl=
b_ram)
626bfa03729959 Hauke Mehrtens      2021-10-13  269  		seq_puts(m, " shared_=
ftlb_ram");
626bfa03729959 Hauke Mehrtens      2021-10-13  270  	if (cpu_has_shared_ftl=
b_entries)
626bfa03729959 Hauke Mehrtens      2021-10-13  271  		seq_puts(m, " shared_=
ftlb_entries");
626bfa03729959 Hauke Mehrtens      2021-10-13  272  	if (cpu_has_mipsmt_per=
tccounters)
626bfa03729959 Hauke Mehrtens      2021-10-13  273  		seq_puts(m, " mipsmt_=
pertccounters");
626bfa03729959 Hauke Mehrtens      2021-10-13  274  	if (cpu_has_mmid)
626bfa03729959 Hauke Mehrtens      2021-10-13  275  		seq_puts(m, " mmid");
626bfa03729959 Hauke Mehrtens      2021-10-13  276  	if (cpu_has_mm_sysad)
626bfa03729959 Hauke Mehrtens      2021-10-13  277  		seq_puts(m, " mm_sysa=
d");
626bfa03729959 Hauke Mehrtens      2021-10-13  278  	if (cpu_has_mm_full)
626bfa03729959 Hauke Mehrtens      2021-10-13  279  		seq_puts(m, " mm_full=
");
626bfa03729959 Hauke Mehrtens      2021-10-13  280  	seq_puts(m, "\n");
626bfa03729959 Hauke Mehrtens      2021-10-13  281  =

f6771dbb27c704 Ralf Baechle        2007-11-08  282  	seq_printf(m, "shadow =
register sets\t: %d\n",
f6771dbb27c704 Ralf Baechle        2007-11-08  283  		      cpu_data[n].srs=
ets);
e77c32fe284a4d David Daney         2010-12-21  284  	seq_printf(m, "kscratc=
h registers\t: %d\n",
e77c32fe284a4d David Daney         2010-12-21  285  		      hweight8(cpu_da=
ta[n].kscratch_mask));
bda4584cd943d7 Huacai Chen         2014-06-26  286  	seq_printf(m, "package=
\t\t\t: %d\n", cpu_data[n].package);
f875a832d20285 Paul Burton         2017-08-12  287  	seq_printf(m, "core\t\=
t\t: %d\n", cpu_core(&cpu_data[n]));
5508d456e9992b Ralf Baechle        2014-04-03  288  =


:::::: The code@line 61 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7250064437504298621==--

