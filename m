Content-Type: multipart/mixed; boundary="===============2839932910709040473=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol 'return'
Date: Sat, 18 Jun 2022 08:16:20 +0800
Message-ID: <202206180816.SNKfQzGv-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2839932910709040473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/ia64=
/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol 'return'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: 521611f961a7dda92eefa26e1afd3914c06af64e [3/7] bitops: unify non-at=
omic bitops prototypes across architectures
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
config: ia64-randconfig-s032-20220617 (https://download.01.org/0day-ci/arch=
ive/20220618/202206180816.SNKfQzGv-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/alobakin/linux/commit/521611f961a7dda92eefa26e=
1afd3914c06af64e
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout 521611f961a7dda92eefa26e1afd3914c06af64e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Di=
a64 SHELL=3D/bin/bash fs/fuse/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/acl.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/xattr.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/control.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/ioctl.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/readdir.c: note: in included file (through include/linux/bitops.=
h, include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/inode.c: note: in included file (through include/linux/bitops.h,=
 include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dir.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/dev.c: note: in included file (through include/linux/bitops.h, i=
nclude/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:65:1: sparse: sparse: unreplaced symbol '=
return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:147:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:187:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:238:9: sparse: sparse: unreplaced symbol =
'p'
>> arch/ia64/include/asm/bitops.h:239:9: sparse: sparse: unreplaced symbol =
'm'
>> arch/ia64/include/asm/bitops.h:240:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:242:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:242:15: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:243:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:243:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:236:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:283:9: sparse: sparse: unreplaced symbol =
'p'
   arch/ia64/include/asm/bitops.h:284:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:285:9: sparse: sparse: unreplaced symbol =
'oldbitset'
   arch/ia64/include/asm/bitops.h:287:10: sparse: sparse: unreplaced symbol=
 'p'
   arch/ia64/include/asm/bitops.h:287:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:288:16: sparse: sparse: unreplaced symbol=
 'oldbitset'
   arch/ia64/include/asm/bitops.h:288:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:281:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'old'
>> arch/ia64/include/asm/bitops.h:326:9: sparse: sparse: unreplaced symbol =
'bit'
   arch/ia64/include/asm/bitops.h:327:9: sparse: sparse: unreplaced symbol =
'm'
   arch/ia64/include/asm/bitops.h:329:9: sparse: sparse: unreplaced symbol =
'old'
   arch/ia64/include/asm/bitops.h:329:16: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:10: sparse: sparse: unreplaced symbol=
 'm'
   arch/ia64/include/asm/bitops.h:330:14: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:330:20: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:17: sparse: sparse: unreplaced symbol=
 'old'
   arch/ia64/include/asm/bitops.h:331:23: sparse: sparse: unreplaced symbol=
 'bit'
   arch/ia64/include/asm/bitops.h:331:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:324:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   arch/ia64/include/asm/bitops.h:337:9: sparse: sparse: unreplaced symbol =
'return'
   arch/ia64/include/asm/bitops.h:335:1: sparse: sparse: unreplaced symbol =
'return'
   fs/fuse/file.c: note: in included file (through include/linux/bitops.h, =
include/linux/thread_info.h, include/asm-generic/preempt.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'

vim +/return +65 arch/ia64/include/asm/bitops.h

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   54  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   55  /**
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   56   * arch___set_bit - Set a bit in memory
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   57   * @nr: the bit to set
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   58   * @addr: the address to start counting from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   59   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   60   * Unlike set_bit(), this function is non-atomic and may be reordere=
d.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   61   * If it's called on the same region of memory simultaneously, the e=
ffect
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   62   * may be that only one operation succeeds.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   63   */
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
   64  static __always_inline void
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  @65  arch___set_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   66  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   67  	*((__u32 *) addr + (nr >> 5)) |=3D (1 << (nr & 31));
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   68  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   69  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   70  /**
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   71   * clear_bit - Clears a bit in memory
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   72   * @nr: Bit to clear
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   73   * @addr: Address to start counting from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   74   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   75   * clear_bit() is atomic and may not be reordered.  However, it does
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   76   * not contain a memory barrier, so if it is used for locking purpos=
es,
0cd64efb61f1e68 arch/ia64/include/asm/bitops.h Peter Zijlstra    2014-03-13=
   77   * you should call smp_mb__before_atomic() and/or smp_mb__after_atom=
ic()
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   78   * in order to ensure changes are visible on other processors.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   79   */
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   80  static __inline__ void
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   81  clear_bit (int nr, volatile void *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   82  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   83  	__u32 mask, old, new;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   84  	volatile __u32 *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   85  	CMPXCHG_BUGCHECK_DECL
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   86  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   87  	m =3D (volatile __u32 *) addr + (nr >> 5);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   88  	mask =3D ~(1 << (nr & 31));
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   89  	do {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   90  		CMPXCHG_BUGCHECK(m);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   91  		old =3D *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   92  		new =3D old & mask;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   93  	} while (cmpxchg_acq(m, old, new) !=3D old);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   94  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
   95  =

87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
   96  /**
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
   97   * clear_bit_unlock - Clears a bit in memory with release
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
   98   * @nr: Bit to clear
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
   99   * @addr: Address to start counting from
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  100   *
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  101   * clear_bit_unlock() is atomic and may not be reordered.  It does
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  102   * contain a memory barrier suitable for unlock type operations.
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  103   */
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  104  static __inline__ void
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  105  clear_bit_unlock (int nr, volatile void *addr)
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  106  {
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  107  	__u32 mask, old, new;
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  108  	volatile __u32 *m;
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  109  	CMPXCHG_BUGCHECK_DECL
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  110  =

87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  111  	m =3D (volatile __u32 *) addr + (nr >> 5);
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  112  	mask =3D ~(1 << (nr & 31));
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  113  	do {
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  114  		CMPXCHG_BUGCHECK(m);
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  115  		old =3D *m;
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  116  		new =3D old & mask;
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  117  	} while (cmpxchg_rel(m, old, new) !=3D old);
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  118  }
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  119  =

87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  120  /**
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  121   * __clear_bit_unlock - Non-atomically clears a bit in memory with r=
elease
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  122   * @nr: Bit to clear
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  123   * @addr: Address to start counting from
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  124   *
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  125   * Similarly to clear_bit_unlock, the implementation uses a store
0199c4e68d1f028 arch/ia64/include/asm/bitops.h Thomas Gleixner   2009-12-02=
  126   * with release semantics. See also arch_spin_unlock().
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  127   */
a3ebdb6c423dff4 include/asm-ia64/bitops.h      Christoph Lameter 2007-12-18=
  128  static __inline__ void
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  129  __clear_bit_unlock(int nr, void *addr)
a3ebdb6c423dff4 include/asm-ia64/bitops.h      Christoph Lameter 2007-12-18=
  130  {
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  131  	__u32 * const m =3D (__u32 *) addr + (nr >> 5);
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  132  	__u32 const new =3D *m & ~(1 << (nr & 31));
a3ebdb6c423dff4 include/asm-ia64/bitops.h      Christoph Lameter 2007-12-18=
  133  =

a3ebdb6c423dff4 include/asm-ia64/bitops.h      Christoph Lameter 2007-12-18=
  134  	ia64_st4_rel_nta(m, new);
a3ebdb6c423dff4 include/asm-ia64/bitops.h      Christoph Lameter 2007-12-18=
  135  }
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  136  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  137  /**
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  138   * arch___clear_bit - Clears a bit in memory (non-atomic version)
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  139   * @nr: the bit to clear
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  140   * @addr: the address to start counting from
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  141   *
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  142   * Unlike clear_bit(), this function is non-atomic and may be reorde=
red.
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  143   * If it's called on the same region of memory simultaneously, the e=
ffect
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  144   * may be that only one operation succeeds.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  145   */
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  146  static __always_inline void
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  147  arch___clear_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  148  {
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  149  	*((__u32 *) addr + (nr >> 5)) &=3D ~(1 << (nr & 31));
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  150  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  151  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  152  /**
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  153   * change_bit - Toggle a bit in memory
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  154   * @nr: Bit to toggle
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  155   * @addr: Address to start counting from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  156   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  157   * change_bit() is atomic and may not be reordered.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  158   * Note that @nr may be almost arbitrarily large; this function is n=
ot
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  159   * restricted to acting on a single-word quantity.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  160   */
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  161  static __inline__ void
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  162  change_bit (int nr, volatile void *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  163  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  164  	__u32 bit, old, new;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  165  	volatile __u32 *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  166  	CMPXCHG_BUGCHECK_DECL
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  167  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  168  	m =3D (volatile __u32 *) addr + (nr >> 5);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  169  	bit =3D (1 << (nr & 31));
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  170  	do {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  171  		CMPXCHG_BUGCHECK(m);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  172  		old =3D *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  173  		new =3D old ^ bit;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  174  	} while (cmpxchg_acq(m, old, new) !=3D old);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  175  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  176  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  177  /**
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  178   * arch___change_bit - Toggle a bit in memory
5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  179   * @nr: the bit to toggle
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  180   * @addr: the address to start counting from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  181   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  182   * Unlike change_bit(), this function is non-atomic and may be reord=
ered.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  183   * If it's called on the same region of memory simultaneously, the e=
ffect
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  184   * may be that only one operation succeeds.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  185   */
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  186  static __always_inline void
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
 @187  arch___change_bit(unsigned long nr, volatile unsigned long *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  188  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  189  	*((__u32 *) addr + (nr >> 5)) ^=3D (1 << (nr & 31));
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  190  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  191  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  192  /**
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  193   * test_and_set_bit - Set a bit and return its old value
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  194   * @nr: Bit to set
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  195   * @addr: Address to count from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  196   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  197   * This operation is atomic and cannot be reordered.  =

5302ac501936747 include/asm-ia64/bitops.h      Zoltan Menyhart   2008-02-04=
  198   * It also implies the acquisition side of the memory barrier.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  199   */
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  200  static __inline__ int
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  201  test_and_set_bit (int nr, volatile void *addr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  202  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  203  	__u32 bit, old, new;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  204  	volatile __u32 *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  205  	CMPXCHG_BUGCHECK_DECL
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  206  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  207  	m =3D (volatile __u32 *) addr + (nr >> 5);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  208  	bit =3D 1 << (nr & 31);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  209  	do {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  210  		CMPXCHG_BUGCHECK(m);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  211  		old =3D *m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  212  		new =3D old | bit;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  213  	} while (cmpxchg_acq(m, old, new) !=3D old);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  214  	return (old & bit) !=3D 0;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  215  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  216  =

87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  217  /**
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  218   * test_and_set_bit_lock - Set a bit and return its old value for lo=
ck
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  219   * @nr: Bit to set
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  220   * @addr: Address to count from
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  221   *
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  222   * This is the same as test_and_set_bit on ia64
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  223   */
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  224  #define test_and_set_bit_lock test_and_set_bit
87371e4fa4901d8 include/asm-ia64/bitops.h      Nicholas Piggin   2007-10-18=
  225  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  226  /**
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  227   * arch___test_and_set_bit - Set a bit and return its old value
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  228   * @nr: Bit to set
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  229   * @addr: Address to count from
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  230   *
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  231   * This operation is non-atomic and can be reordered.  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  232   * If two examples of this operation race, one can appear to succeed
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  233   * but actually fail.  You must protect multiple accesses with a loc=
k.
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  234   */
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  235  static __always_inline bool
521611f961a7dda arch/ia64/include/asm/bitops.h Alexander Lobakin 2022-05-09=
  236  arch___test_and_set_bit(unsigned long nr, volatile unsigned long *ad=
dr)
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  237  {
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
 @238  	__u32 *p =3D (__u32 *) addr + (nr >> 5);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
 @239  	__u32 m =3D 1 << (nr & 31);
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
 @240  	int oldbitset =3D (*p & m) !=3D 0;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  241  =

^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  242  	*p |=3D m;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  243  	return oldbitset;
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  244  }
^1da177e4c3f415 include/asm-ia64/bitops.h      Linus Torvalds    2005-04-16=
  245  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2839932910709040473==--

