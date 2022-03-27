Content-Type: multipart/mixed; boundary="===============4394246706068647337=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] crypto: aes_generic: fixed styling warnings
Date: Sun, 27 Mar 2022 23:13:54 +0800
Message-ID: <202203272347.R0F02xXX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4394246706068647337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220326172051.14722-1-thepaulodoom@thepaulodoom.com>
References: <20220326172051.14722-1-thepaulodoom@thepaulodoom.com>
TO: Paul Lemmermann <thepaulodoom@thepaulodoom.com>
TO: davem(a)davemloft.net
CC: linux-crypto(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Paul Lemmermann <thepaulodoom@thepaulodoom.com>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linux/master linus/ma=
ster v5.17 next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Lemmermann/cryp=
to-aes_generic-fixed-styling-warnings/20220327-014837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2=
.6.git master
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20327/202203272347.R0F02xXX-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d95=
01cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8505b026c91a3e6d6c5=
62a1fe46c2b8c20835de8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Lemmermann/crypto-aes_generic=
-fixed-styling-warnings/20220327-014837
        git checkout 8505b026c91a3e6d6c562a1fe46c2b8c20835de8
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2871:3: note: Control jumps to li=
ne 2923
                   goto out_free_rgrp;
                   ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2923:2: note: Memory is released
           kfree(rdtgrp);
           ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2947:8: note: Returning; memory w=
as released via 5th parameter
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTMON_GROUP, &=
rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2948:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2948:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2951:10: note: Use of memory afte=
r it is freed
           prgrp =3D rdtgrp->mon.parent;
                   ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2980:7: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
           kn =3D rdtgrp->kn;
                ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3041:6: note: Assuming the condit=
ion is false
           if (strchr(name, '\n'))
               ^~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3041:2: note: Taking false branch
           if (strchr(name, '\n'))
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:6: note: Assuming 'rdt_alloc=
_capable' is true
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
               ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:6: note: Left side of '&&' i=
s true
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:27: note: Assuming 'parent_k=
n' is equal to field 'kn'
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3049:2: note: Taking true branch
           if (rdt_alloc_capable && parent_kn =3D=3D rdtgroup_default.kn)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:3050:10: note: Calling 'rdtgroup_=
mkdir_ctrl_mon'
                   return rdtgroup_mkdir_ctrl_mon(parent_kn, name, mode);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2976:8: note: Calling 'mkdir_rdt_=
prepare'
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTCTRL_GROUP, =
&rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2841:7: note: 'prdtgrp' is non-nu=
ll
           if (!prdtgrp) {
                ^~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2841:2: note: Taking false branch
           if (!prdtgrp) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2846:6: note: 'rtype' is not equa=
l to RDTMON_GROUP
           if (rtype =3D=3D RDTMON_GROUP &&
               ^~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2846:28: note: Left side of '&&' =
is false
           if (rtype =3D=3D RDTMON_GROUP &&
                                     ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2856:6: note: Assuming 'rdtgrp' i=
s non-null
           if (!rdtgrp) {
               ^~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2856:2: note: Taking false branch
           if (!rdtgrp) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2868:2: note: Taking true branch
           if (IS_ERR(kn)) {
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2871:3: note: Control jumps to li=
ne 2923
                   goto out_free_rgrp;
                   ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2923:2: note: Memory is released
           kfree(rdtgrp);
           ^~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2976:8: note: Returning; memory w=
as released via 5th parameter
           ret =3D mkdir_rdt_prepare(parent_kn, name, mode, RDTCTRL_GROUP, =
&rdtgrp);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2977:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2977:2: note: Taking false branch
           if (ret)
           ^
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2980:7: note: Use of memory after=
 it is freed
           kn =3D rdtgrp->kn;
                ^~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2987:2: warning: Value stored to =
'ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D 0;
           ^     ~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:2987:2: note: Value stored to 're=
t' is never read
           ret =3D 0;
           ^     ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> crypto/aes_generic.c:1181:13: warning: Value stored to 'kp' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           const u32 *kp =3D ctx->key_enc + 4;
                      ^~   ~~~~~~~~~~~~~~~~
   crypto/aes_generic.c:1181:13: note: Value stored to 'kp' during its init=
ialization is never read
           const u32 *kp =3D ctx->key_enc + 4;
                      ^~   ~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   crypto/asymmetric_keys/asymmetric_type.c:74:9: warning: Access to field =
'len' results in a dereference of a null pointer (loaded from variable 'id_=
2') [clang-analyzer-core.NullDereference]
                   len =3D id_2->len;
                         ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:64:10: note: Assuming 'id_0' is=
 null
           WARN_ON(!id_0 && !id_1 && !id_2);
                   ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:64:10: note: Left side of '&&' =
is true
           WARN_ON(!id_0 && !id_1 && !id_2);
                   ^
   crypto/asymmetric_keys/asymmetric_type.c:64:19: note: Assuming 'id_1' is=
 null
           WARN_ON(!id_0 && !id_1 && !id_2);
                            ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:64:10: note: Left side of '&&' =
is true
           WARN_ON(!id_0 && !id_1 && !id_2);
                   ^
   crypto/asymmetric_keys/asymmetric_type.c:64:28: note: Assuming 'id_2' is=
 null
           WARN_ON(!id_0 && !id_1 && !id_2);
                                     ^
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:64:2: note: Taking true branch
           WARN_ON(!id_0 && !id_1 && !id_2);
           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   crypto/asymmetric_keys/asymmetric_type.c:64:2: note: Loop condition is f=
alse.  Exiting loop
           WARN_ON(!id_0 && !id_1 && !id_2);

vim +/kp +1181 crypto/aes_generic.c

^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1176  =

724ecd3c0eb704 crypto/aes_generic.c Ard Biesheuvel    2019-07-02  1177  sta=
tic void crypto_aes_encrypt(struct crypto_tfm *tfm, u8 *out, const u8 *in)
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1178  {
96e82e4551d38e crypto/aes_generic.c Sebastian Siewior 2007-11-08  1179  	co=
nst struct crypto_aes_ctx *ctx =3D crypto_tfm_ctx(tfm);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1180  	u3=
2 b0[4], b1[4];
96e82e4551d38e crypto/aes_generic.c Sebastian Siewior 2007-11-08 @1181  	co=
nst u32 *kp =3D ctx->key_enc + 4;
96e82e4551d38e crypto/aes_generic.c Sebastian Siewior 2007-11-08  1182  	co=
nst int key_len =3D ctx->key_length;
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1183  =

ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1184  	b0=
[0] =3D ctx->key_enc[0] ^ get_unaligned_le32(in);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1185  	b0=
[1] =3D ctx->key_enc[1] ^ get_unaligned_le32(in + 4);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1186  	b0=
[2] =3D ctx->key_enc[2] ^ get_unaligned_le32(in + 8);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1187  	b0=
[3] =3D ctx->key_enc[3] ^ get_unaligned_le32(in + 12);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1188  =

96e82e4551d38e crypto/aes_generic.c Sebastian Siewior 2007-11-08  1189  	if=
 (key_len > 24) {
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1190  		f=
_nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1191  		f=
_nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1192  	}
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1193  =

96e82e4551d38e crypto/aes_generic.c Sebastian Siewior 2007-11-08  1194  	if=
 (key_len > 16) {
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1195  		f=
_nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1196  		f=
_nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1197  	}
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1198  =

^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1199  	f_=
nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1200  	f_=
nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1201  	f_=
nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1202  	f_=
nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1203  	f_=
nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1204  	f_=
nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1205  	f_=
nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1206  	f_=
nround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1207  	f_=
nround(b1, b0, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1208  	f_=
lround(b0, b1, kp);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1209  =

ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1210  	pu=
t_unaligned_le32(b0[0], out);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1211  	pu=
t_unaligned_le32(b0[1], out + 4);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1212  	pu=
t_unaligned_le32(b0[2], out + 8);
ec38a9376163f9 crypto/aes_generic.c Ard Biesheuvel    2017-02-02  1213  	pu=
t_unaligned_le32(b0[3], out + 12);
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1214  }
^1da177e4c3f41 crypto/aes.c         Linus Torvalds    2005-04-16  1215  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4394246706068647337==--

