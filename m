Content-Type: multipart/mixed; boundary="===============0609074585768106342=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'return'
Date: Sat, 18 Jun 2022 06:13:36 +0800
Message-ID: <202206180628.dvtrEDQY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0609074585768106342==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'return'"
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
:::::: branch date: 8 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20220=
618/202206180628.dvtrEDQY-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/alobakin/linux/commit/521611f961a7dda92eefa26e=
1afd3914c06af64e
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout 521611f961a7dda92eefa26e1afd3914c06af64e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Di386 SHELL=3D/bin/bash net/batman-adv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/log.c: note: in included file (through include/linux/bito=
ps.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/log.c: note: in included file (through arch/x86/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bitarray.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/bitarray.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_common.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/gateway_common.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_algo.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/bat_algo.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hash.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/hash.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/fragmentation.c: note: in included file (through include/=
linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/fragmentation.c: note: in included file (through arch/x86=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/main.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/main.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/netlink.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/netlink.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/hard-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/hard-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/gateway_client.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/gateway_client.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/distributed-arp-table.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/network-coding.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/network-coding.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/originator.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/originator.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/multicast.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/multicast.c: note: in included file (through arch/x86/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
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
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
include/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/bridge_loop_avoidance.c: note: in included file (through =
arch/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel=
.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/bat_iv_ogm.c: note: in included file (through arch/x86/in=
clude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/send.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/send.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/soft-interface.c: note: in included file (through include=
/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/soft-interface.c: note: in included file (through arch/x8=
6/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tvlv.c: note: in included file (through include/linux/bit=
ops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/tvlv.c: note: in included file (through arch/x86/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/tp_meter.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/tp_meter.c: note: in included file (through arch/x86/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/routing.c: note: in included file (through include/linux/=
bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/routing.c: note: in included file (through arch/x86/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'
--
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:66:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
>> include/asm-generic/bitops/instrumented-non-atomic.h:26:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:92:1: sparse: sparse: unreplaced symbol 'r=
eturn'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:42:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:117:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:58:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
>> arch/x86/include/asm/bitops.h:150:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:154:26: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:156:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:148:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:100:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:97:1: sparse: spars=
e: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:176:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:180:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:182:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:174:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:115:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:112:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:188:9: sparse: sparse: unreplaced symbol '=
oldbit'
   arch/x86/include/asm/bitops.h:192:35: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:16: sparse: sparse: unreplaced symbol =
'oldbit'
   arch/x86/include/asm/bitops.h:195:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:186:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
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
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:130:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:127:1: sparse: spar=
se: unreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   arch/x86/include/asm/bitops.h:225:9: sparse: sparse: unreplaced symbol '=
return'
   arch/x86/include/asm/bitops.h:223:1: sparse: sparse: unreplaced symbol '=
return'
   net/batman-adv/translation-table.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/kernel.h, include/linux/skbuff.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   net/batman-adv/translation-table.c: note: in included file (through arch=
/x86/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, =
...):
   include/asm-generic/bitops/instrumented-non-atomic.h:142:9: sparse: spar=
se: unreplaced symbol 'return'
   include/asm-generic/bitops/instrumented-non-atomic.h:139:1: sparse: spar=
se: unreplaced symbol 'return'

vim +/return +66 arch/x86/include/asm/bitops.h

1a750e0cd7a30c include/asm-x86/bitops.h      Linus Torvalds      2008-06-18=
   64  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   65  static __always_inline void
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  @66  arch___set_bit(unsigned long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   67  {
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
   68  	asm volatile(__ASM_SIZE(bts) " %1,%0" : : ADDR, "Ir" (nr) : "memory=
");
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   69  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   70  =

c8399943bdb70f arch/x86/include/asm/bitops.h Andi Kleen          2009-01-12=
   71  static __always_inline void
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   72  arch_clear_bit(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   73  {
bdd50d7421b2f8 arch/x86/include/asm/bitops.h Masahiro Yamada     2019-07-23=
   74  	if (__builtin_constant_p(nr)) {
c071b0f11e7fb9 arch/x86/include/asm/bitops.h Nick Desaulniers    2020-05-22=
   75  		asm volatile(LOCK_PREFIX "andb %b1,%0"
7dbceaf9bb6891 include/asm-x86/bitops.h      Ingo Molnar         2008-06-20=
   76  			: CONST_MASK_ADDR(nr, addr)
c071b0f11e7fb9 arch/x86/include/asm/bitops.h Nick Desaulniers    2020-05-22=
   77  			: "iq" (~CONST_MASK(nr)));
7dbceaf9bb6891 include/asm-x86/bitops.h      Ingo Molnar         2008-06-20=
   78  	} else {
22636f8c951124 arch/x86/include/asm/bitops.h Jan Beulich         2018-02-26=
   79  		asm volatile(LOCK_PREFIX __ASM_SIZE(btr) " %1,%0"
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
   80  			: : RLONG_ADDR(addr), "Ir" (nr) : "memory");
7dbceaf9bb6891 include/asm-x86/bitops.h      Ingo Molnar         2008-06-20=
   81  	}
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   82  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   83  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   84  static __always_inline void
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   85  arch_clear_bit_unlock(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   86  {
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   87  	barrier();
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   88  	arch_clear_bit(nr, addr);
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   89  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   90  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   91  static __always_inline void
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
   92  arch___clear_bit(unsigned long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   93  {
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
   94  	asm volatile(__ASM_SIZE(btr) " %1,%0" : : ADDR, "Ir" (nr) : "memory=
");
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   95  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
   96  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   97  static __always_inline bool
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
   98  arch_clear_bit_unlock_is_negative_byte(long nr, volatile unsigned lo=
ng *addr)
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
   99  {
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  100  	bool negative;
3c52b5c64326d9 arch/x86/include/asm/bitops.h Uros Bizjak         2017-09-06=
  101  	asm volatile(LOCK_PREFIX "andb %2,%1"
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  102  		CC_SET(s)
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
  103  		: CC_OUT(s) (negative), WBYTE_ADDR(addr)
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  104  		: "ir" ((char) ~(1 << nr)) : "memory");
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  105  	return negative;
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  106  }
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  107  #define arch_clear_bit_unlock_is_negative_byte                      =
           \
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  108  	arch_clear_bit_unlock_is_negative_byte
b91e1302ad9b80 arch/x86/include/asm/bitops.h Linus Torvalds      2016-12-27=
  109  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  110  static __always_inline void
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  111  arch___clear_bit_unlock(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  112  {
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  113  	arch___clear_bit(nr, addr);
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  114  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  115  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  116  static __always_inline void
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  117  arch___change_bit(unsigned long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  118  {
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
  119  	asm volatile(__ASM_SIZE(btc) " %1,%0" : : ADDR, "Ir" (nr) : "memory=
");
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  120  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  121  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  122  static __always_inline void
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  123  arch_change_bit(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  124  {
bdd50d7421b2f8 arch/x86/include/asm/bitops.h Masahiro Yamada     2019-07-23=
  125  	if (__builtin_constant_p(nr)) {
c071b0f11e7fb9 arch/x86/include/asm/bitops.h Nick Desaulniers    2020-05-22=
  126  		asm volatile(LOCK_PREFIX "xorb %b1,%0"
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24=
  127  			: CONST_MASK_ADDR(nr, addr)
c071b0f11e7fb9 arch/x86/include/asm/bitops.h Nick Desaulniers    2020-05-22=
  128  			: "iq" (CONST_MASK(nr)));
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24=
  129  	} else {
22636f8c951124 arch/x86/include/asm/bitops.h Jan Beulich         2018-02-26=
  130  		asm volatile(LOCK_PREFIX __ASM_SIZE(btc) " %1,%0"
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
  131  			: : RLONG_ADDR(addr), "Ir" (nr) : "memory");
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24=
  132  	}
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  133  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  134  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  135  static __always_inline bool
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  136  arch_test_and_set_bit(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  137  {
288e4521f0f671 arch/x86/include/asm/bitops.h Peter Zijlstra      2018-10-03=
  138  	return GEN_BINARY_RMWcc(LOCK_PREFIX __ASM_SIZE(bts), *addr, c, "Ir"=
, nr);
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  139  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  140  =

117780eef77407 arch/x86/include/asm/bitops.h H. Peter Anvin      2016-06-08=
  141  static __always_inline bool
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  142  arch_test_and_set_bit_lock(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  143  {
751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  144  	return arch_test_and_set_bit(nr, addr);
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  145  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  146  =

751ad98d5f881d arch/x86/include/asm/bitops.h Marco Elver         2019-07-11=
  147  static __always_inline bool
521611f961a7dd arch/x86/include/asm/bitops.h Alexander Lobakin   2022-05-09=
  148  arch___test_and_set_bit(unsigned long nr, volatile unsigned long *ad=
dr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  149  {
117780eef77407 arch/x86/include/asm/bitops.h H. Peter Anvin      2016-06-08=
 @150  	bool oldbit;
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  151  =

22636f8c951124 arch/x86/include/asm/bitops.h Jan Beulich         2018-02-26=
  152  	asm(__ASM_SIZE(bts) " %2,%1"
86b61240d4c233 arch/x86/include/asm/bitops.h H. Peter Anvin      2016-06-08=
  153  	    CC_SET(c)
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
  154  	    : CC_OUT(c) (oldbit)
5b77e95dd7790f arch/x86/include/asm/bitops.h Alexander Potapenko 2019-04-02=
  155  	    : ADDR, "Ir" (nr) : "memory");
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  156  	return oldbit;
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  157  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30=
  158  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0609074585768106342==--

