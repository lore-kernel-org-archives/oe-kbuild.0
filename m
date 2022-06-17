Content-Type: multipart/mixed; boundary="===============6016317994634738168=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symbol 'mask'
Date: Sat, 18 Jun 2022 04:40:17 +0800
Message-ID: <202206180427.wMt33c6Z-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6016317994634738168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/sh/i=
nclude/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symbol 'mask'"
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
:::::: branch date: 7 hours ago
:::::: commit date: 8 hours ago
config: sh-randconfig-s031-20220617 (https://download.01.org/0day-ci/archiv=
e/20220618/202206180427.wMt33c6Z-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
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
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
h SHELL=3D/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/constants.c:318:9: sparse: sparse: trying to concatenate 26=
550-character string (8191 bytes max)
--
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
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
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
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
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
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
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
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
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
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
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
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
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
>> arch/sh/include/asm/bitops-op32.h:32:17: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:33:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:35:23: sparse: sparse: unreplaced symb=
ol 'mask'
>> arch/sh/include/asm/bitops-op32.h:22:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
>> arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
>> include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
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
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'

vim +/mask +32 arch/sh/include/asm/bitops-op32.h

0d5bbe0bc2583c Paul Mundt        2008-11-25   20  =

521611f961a7dd Alexander Lobakin 2022-05-09   21  static __always_inline vo=
id
521611f961a7dd Alexander Lobakin 2022-05-09  @22  arch___set_bit(unsigned l=
ong nr, volatile unsigned long *addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   23  {
e3c0f6f3fbdaca Masahiro Yamada   2019-07-23   24  	if (__builtin_constant_p=
(nr)) {
0d5bbe0bc2583c Paul Mundt        2008-11-25   25  		__asm__ __volatile__ (
0d5bbe0bc2583c Paul Mundt        2008-11-25   26  			"bset.b %1, @(%O2,%0)	=
	! __set_bit\n\t"
0d5bbe0bc2583c Paul Mundt        2008-11-25   27  			: "+r" (addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   28  			: "i" (BYTE_OFFSET(nr)=
), "i" (BYTE_NUMBER(nr))
0d5bbe0bc2583c Paul Mundt        2008-11-25   29  			: "t", "memory"
0d5bbe0bc2583c Paul Mundt        2008-11-25   30  		);
0d5bbe0bc2583c Paul Mundt        2008-11-25   31  	} else {
0d5bbe0bc2583c Paul Mundt        2008-11-25  @32  		unsigned long mask =3D =
BIT_MASK(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25  @33  		unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   34  =

0d5bbe0bc2583c Paul Mundt        2008-11-25   35  		*p |=3D mask;
0d5bbe0bc2583c Paul Mundt        2008-11-25   36  	}
0d5bbe0bc2583c Paul Mundt        2008-11-25   37  }
0d5bbe0bc2583c Paul Mundt        2008-11-25   38  =

521611f961a7dd Alexander Lobakin 2022-05-09   39  static __always_inline vo=
id
521611f961a7dd Alexander Lobakin 2022-05-09   40  arch___clear_bit(unsigned=
 long nr, volatile unsigned long *addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   41  {
e3c0f6f3fbdaca Masahiro Yamada   2019-07-23   42  	if (__builtin_constant_p=
(nr)) {
0d5bbe0bc2583c Paul Mundt        2008-11-25   43  		__asm__ __volatile__ (
0d5bbe0bc2583c Paul Mundt        2008-11-25   44  			"bclr.b %1, @(%O2,%0)	=
	! __clear_bit\n\t"
0d5bbe0bc2583c Paul Mundt        2008-11-25   45  			: "+r" (addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   46  			: "i" (BYTE_OFFSET(nr)=
),
0d5bbe0bc2583c Paul Mundt        2008-11-25   47  			  "i" (BYTE_NUMBER(nr))
0d5bbe0bc2583c Paul Mundt        2008-11-25   48  			: "t", "memory"
0d5bbe0bc2583c Paul Mundt        2008-11-25   49  		);
0d5bbe0bc2583c Paul Mundt        2008-11-25   50  	} else {
0d5bbe0bc2583c Paul Mundt        2008-11-25   51  		unsigned long mask =3D =
BIT_MASK(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   52  		unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   53  =

0d5bbe0bc2583c Paul Mundt        2008-11-25   54  		*p &=3D ~mask;
0d5bbe0bc2583c Paul Mundt        2008-11-25   55  	}
0d5bbe0bc2583c Paul Mundt        2008-11-25   56  }
0d5bbe0bc2583c Paul Mundt        2008-11-25   57  =

0d5bbe0bc2583c Paul Mundt        2008-11-25   58  /**
521611f961a7dd Alexander Lobakin 2022-05-09   59   * arch___change_bit - To=
ggle a bit in memory
0d5bbe0bc2583c Paul Mundt        2008-11-25   60   * @nr: the bit to change
0d5bbe0bc2583c Paul Mundt        2008-11-25   61   * @addr: the address to =
start counting from
0d5bbe0bc2583c Paul Mundt        2008-11-25   62   *
0d5bbe0bc2583c Paul Mundt        2008-11-25   63   * Unlike change_bit(), t=
his function is non-atomic and may be reordered.
0d5bbe0bc2583c Paul Mundt        2008-11-25   64   * If it's called on the =
same region of memory simultaneously, the effect
0d5bbe0bc2583c Paul Mundt        2008-11-25   65   * may be that only one o=
peration succeeds.
0d5bbe0bc2583c Paul Mundt        2008-11-25   66   */
521611f961a7dd Alexander Lobakin 2022-05-09   67  static __always_inline vo=
id
521611f961a7dd Alexander Lobakin 2022-05-09   68  arch___change_bit(unsigne=
d long nr, volatile unsigned long *addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   69  {
e3c0f6f3fbdaca Masahiro Yamada   2019-07-23   70  	if (__builtin_constant_p=
(nr)) {
0d5bbe0bc2583c Paul Mundt        2008-11-25   71  		__asm__ __volatile__ (
0d5bbe0bc2583c Paul Mundt        2008-11-25   72  			"bxor.b %1, @(%O2,%0)	=
	! __change_bit\n\t"
0d5bbe0bc2583c Paul Mundt        2008-11-25   73  			: "+r" (addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   74  			: "i" (BYTE_OFFSET(nr)=
),
0d5bbe0bc2583c Paul Mundt        2008-11-25   75  			  "i" (BYTE_NUMBER(nr))
0d5bbe0bc2583c Paul Mundt        2008-11-25   76  			: "t", "memory"
0d5bbe0bc2583c Paul Mundt        2008-11-25   77  		);
0d5bbe0bc2583c Paul Mundt        2008-11-25   78  	} else {
0d5bbe0bc2583c Paul Mundt        2008-11-25   79  		unsigned long mask =3D =
BIT_MASK(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   80  		unsigned long *p =3D ((=
unsigned long *)addr) + BIT_WORD(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   81  =

0d5bbe0bc2583c Paul Mundt        2008-11-25   82  		*p ^=3D mask;
0d5bbe0bc2583c Paul Mundt        2008-11-25   83  	}
0d5bbe0bc2583c Paul Mundt        2008-11-25   84  }
0d5bbe0bc2583c Paul Mundt        2008-11-25   85  =

0d5bbe0bc2583c Paul Mundt        2008-11-25   86  /**
521611f961a7dd Alexander Lobakin 2022-05-09   87   * arch___test_and_set_bi=
t - Set a bit and return its old value
0d5bbe0bc2583c Paul Mundt        2008-11-25   88   * @nr: Bit to set
0d5bbe0bc2583c Paul Mundt        2008-11-25   89   * @addr: Address to coun=
t from
0d5bbe0bc2583c Paul Mundt        2008-11-25   90   *
0d5bbe0bc2583c Paul Mundt        2008-11-25   91   * This operation is non-=
atomic and can be reordered.
0d5bbe0bc2583c Paul Mundt        2008-11-25   92   * If two examples of thi=
s operation race, one can appear to succeed
0d5bbe0bc2583c Paul Mundt        2008-11-25   93   * but actually fail.  Yo=
u must protect multiple accesses with a lock.
0d5bbe0bc2583c Paul Mundt        2008-11-25   94   */
521611f961a7dd Alexander Lobakin 2022-05-09   95  static __always_inline bo=
ol
521611f961a7dd Alexander Lobakin 2022-05-09   96  arch___test_and_set_bit(u=
nsigned long nr, volatile unsigned long *addr)
0d5bbe0bc2583c Paul Mundt        2008-11-25   97  {
0d5bbe0bc2583c Paul Mundt        2008-11-25  @98  	unsigned long mask =3D B=
IT_MASK(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25   99  	unsigned long *p =3D ((u=
nsigned long *)addr) + BIT_WORD(nr);
0d5bbe0bc2583c Paul Mundt        2008-11-25 @100  	unsigned long old =3D *p;
0d5bbe0bc2583c Paul Mundt        2008-11-25  101  =

0d5bbe0bc2583c Paul Mundt        2008-11-25  102  	*p =3D old | mask;
0d5bbe0bc2583c Paul Mundt        2008-11-25  103  	return (old & mask) !=3D=
 0;
0d5bbe0bc2583c Paul Mundt        2008-11-25  104  }
0d5bbe0bc2583c Paul Mundt        2008-11-25  105  =


:::::: The code at line 32 was first introduced by commit
:::::: 0d5bbe0bc2583c4dc06ea00adccf07c3acd1481d sh: Provide optimized non-a=
tomic bitops for SH-2A.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6016317994634738168==--

