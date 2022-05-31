Content-Type: multipart/mixed; boundary="===============7171325890547064545=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provide...
Date: Wed, 01 Jun 2022 06:52:48 +0800
Message-ID: <202206010621.oF970f8F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7171325890547064545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/mips/kernel/proc.c:61:2: warning: Call to function 'sprintf' is insec=
ure as it does not provide bounding of the memory buffer or security checks=
 introduced in the C11 standard. Replace with analogous functions that supp=
ort length arguments or provides boundary checks such as 'sprintf_s' in cas=
e of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandl=
ing]"
:::::: =


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
head:   e1cbc3b96a9974746b2a80c3a6c8a0f7eff7b1b5
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=3Dgnu=
11
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-c004-20220531 (https://download.01.org/0day-ci/arch=
ive/20220601/202206010621.oF970f8F-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825ab=
d6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8c07082a810fbb9db303a2b66b66b8d7e588b53
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8c07082a810fbb9db303a2b66b66b8d7e588b53
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   arch/mips/mm/tlbex.c:1940:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:1940:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:1968:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, handle_tlbs_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:1968:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(p, 0, handle_tlbs_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:1969:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:1969:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:1970:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:1970:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:1998:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, handle_tlbm_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:1998:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(p, 0, handle_tlbm_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:1999:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:1999:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2000:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2000:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2115:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, handle_tlbl_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2115:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(p, 0, handle_tlbl_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2116:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2116:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2117:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2117:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2316:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, handle_tlbs_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2316:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(p, 0, handle_tlbs_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2317:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2317:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2318:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2318:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2372:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(p, 0, handle_tlbm_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2372:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(p, 0, handle_tlbm_end - (char *)p);
           ^~~~~~
   arch/mips/mm/tlbex.c:2373:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2373:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(labels, 0, sizeof(labels));
           ^~~~~~
   arch/mips/mm/tlbex.c:2374:2: warning: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.=
insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   arch/mips/mm/tlbex.c:2374:2: note: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11
           memset(relocs, 0, sizeof(relocs));
           ^~~~~~
   Suppressed 35 warnings (31 in non-user code, 4 with check filters).
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
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
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
   39 warnings generated.
   Suppressed 39 warnings (39 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   31 warnings generated.
   Suppressed 31 warnings (31 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
   Suppressed 32 warnings (31 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   55 warnings generated.
   fs/btrfs/sysfs.c:626:8: warning: Dereference of null pointer (loaded fro=
m variable 'value_ptr') [clang-analyzer-core.NullDereference]
           val =3D *value_ptr;
                 ^
   fs/btrfs/sysfs.c:644:34: note: Calling 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1097:6: note: Assuming the condition is false
           if (kobj->ktype !=3D &btrfs_ktype)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:1097:2: note: Taking false branch
           if (kobj->ktype !=3D &btrfs_ktype)
           ^
   fs/btrfs/sysfs.c:1099:2: note: Returning pointer
           return to_fs_devs(kobj)->fs_info;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:644:34: note: Returning from 'to_fs_info'
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:644:2: note: 'fs_info' initialized here
           struct btrfs_fs_info *fs_info =3D to_fs_info(kobj->parent);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:645:2: note: 'block_rsv' initialized here
           struct btrfs_block_rsv *block_rsv =3D &fs_info->global_block_rsv;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:24: note: Passing value via 1st parameter 'value_pt=
r'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                                 ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/sysfs.c:646:9: note: Calling 'btrfs_show_u64'
           return btrfs_show_u64(&block_rsv->reserved, &block_rsv->lock, bu=
f);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/btrfs/sysfs.c:624:6: note: Assuming 'lock' is null
           if (lock)
               ^~~~
   fs/btrfs/sysfs.c:624:2: note: Taking false branch
           if (lock)
           ^
   fs/btrfs/sysfs.c:626:8: note: Dereference of null pointer (loaded from v=
ariable 'value_ptr')
           val =3D *value_ptr;
                 ^~~~~~~~~~
   fs/btrfs/sysfs.c:802:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(fs_info->super_copy->label, 0, BTRFS_LABEL_SIZE);
           ^~~~~~
   fs/btrfs/sysfs.c:802:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(fs_info->super_copy->label, 0, BTRFS_LABEL_SIZE);
           ^~~~~~
   fs/btrfs/sysfs.c:803:2: warning: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(fs_info->super_copy->label, buf, p_len);
           ^~~~~~
   fs/btrfs/sysfs.c:803:2: note: Call to function 'memcpy' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memcpy_s' in case of C11
           memcpy(fs_info->super_copy->label, buf, p_len);
           ^~~~~~
   fs/btrfs/sysfs.c:1079:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&fs_devs->fsid_kobj, 0, sizeof(struct kobject));
           ^~~~~~
   fs/btrfs/sysfs.c:1079:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(&fs_devs->fsid_kobj, 0, sizeof(struct kobject));
           ^~~~~~
   fs/btrfs/sysfs.c:1280:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(btrfs_feature_attrs, 0, sizeof(btrfs_feature_attrs));
           ^~~~~~
   fs/btrfs/sysfs.c:1280:2: note: Call to function 'memset' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'memset_s' in case of C11
           memset(btrfs_feature_attrs, 0, sizeof(btrfs_feature_attrs));
           ^~~~~~
   fs/btrfs/sysfs.c:1281:2: warning: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11 [clang-analyzer-security.inse=
cureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(btrfs_unknown_feature_names, 0,

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
--===============7171325890547064545==--

