Content-Type: multipart/mixed; boundary="===============3863001414691941117=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c:152:34: warning: Value stored to 'tx_ring' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Sat, 15 Jan 2022 00:41:32 +0800
Message-ID: <202201150047.igGv5biP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3863001414691941117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fb3b0673b7d5b477ed104949450cd511337ba3c6
commit: 1e846c7aeb067fefbd53f03db56e69d160781d9d can: mcp251xfd: move TEF h=
andling into separate file
date:   6 days ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
115/202201150047.igGv5biP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 84654f=
2733f63dc725a7b3d7c55d56849d2d9358)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1e846c7aeb067fefbd53f03db56e69d160781d9d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1e846c7aeb067fefbd53f03db56e69d160781d9d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/parport/parport_pc.c:3086:9: note: Calling 'parport_parse_param'
           return parport_parse_param(irqstr, val, PARPORT_IRQ_AUTO,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/parport/parport_pc.c:3063:2: note: '?' condition is false
           if (!s)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/parport/parport_pc.c:3063:7: note: 's' is null
           if (!s)
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/parport/parport_pc.c:3063:2: note: '?' condition is true
           if (!s)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/parport/parport_pc.c:3063:2: note: Taking true branch
           if (!s)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/parport/parport_pc.c:3064:3: note: Returning without writing to =
'*val'
                   return 0;
                   ^
   drivers/parport/parport_pc.c:3086:9: note: Returning from 'parport_parse=
_param'
           return parport_parse_param(irqstr, val, PARPORT_IRQ_AUTO,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/parport/parport_pc.c:3086:2: note: Returning without writing to =
'*val'
           return parport_parse_param(irqstr, val, PARPORT_IRQ_AUTO,
           ^
   drivers/parport/parport_pc.c:3151:7: note: Returning from 'parport_parse=
_irq'
                   if (parport_parse_irq(irq[i], &val))
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/parport/parport_pc.c:3151:3: note: '?' condition is false
                   if (parport_parse_irq(irq[i], &val))
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/parport/parport_pc.c:3151:3: note: Taking false branch
                   if (parport_parse_irq(irq[i], &val))
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/parport/parport_pc.c:3153:13: note: Assigned value is garbage or=
 undefined
                   irqval[i] =3D val;
                             ^ ~~~
   1 warning generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: warning: Value s=
tored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: note: Value stor=
ed to 'err' is never read
                           err =3D 0;
                           ^     ~
   1 warning generated.
>> drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c:152:34: warning: Value sto=
red to 'tx_ring' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           const struct mcp251xfd_tx_ring *tx_ring =3D priv->tx;
                                           ^~~~~~~   ~~~~~~~~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c:152:34: note: Value stored=
 to 'tx_ring' during its initialization is never read
           const struct mcp251xfd_tx_ring *tx_ring =3D priv->tx;
                                           ^~~~~~~   ~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   drivers/net/can/softing/softing_fw.c:531:3: warning: Value stored to 'er=
ror_reporting' is never read [clang-analyzer-deadcode.DeadStores]
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/softing/softing_fw.c:531:3: note: Value stored to 'error=
_reporting' is never read
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   sound/drivers/opl4/opl4_mixer.c:74:2: warning: Call to function 'strcat'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(card->mixername, ",OPL4");
           ^~~~~~
   sound/drivers/opl4/opl4_mixer.c:74:2: note: Call to function 'strcat' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcat'. CWE-119
           strcat(card->mixername, ",OPL4");
           ^~~~~~
   2 warnings generated.
   sound/drivers/opl4/opl4_synth.c:444:18: warning: The result of the left =
shift is undefined because the left operand is negative [clang-analyzer-cor=
e.UndefinedBinaryOperatorResult]
                          (octave << 4) | ((pitch >> 7) & OPL4_F_NUMBER_HIG=
H_MASK));
                                  ^
   sound/drivers/opl4/opl4_synth.c:589:2: note: Control jumps to 'case 128:=
'  at line 618
           switch (type) {
           ^
   sound/drivers/opl4/opl4_synth.c:619:3: note: Calling 'snd_opl4_do_for_ch=
annel'
                   snd_opl4_do_for_channel(opl4, chan, snd_opl4_update_pitc=
h);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   sound/drivers/opl4/opl4_synth.c:340:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&opl4->reg_lock, flags);
           ^
   include/linux/spinlock.h:379:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:240:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   sound/drivers/opl4/opl4_synth.c:340:2: note: Loop condition is false.  E=
xiting loop
           spin_lock_irqsave(&opl4->reg_lock, flags);
           ^
   include/linux/spinlock.h:377:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \
                                                                   ^
   sound/drivers/opl4/opl4_synth.c:341:2: note: Loop condition is true.  En=
tering loop body
           for (i =3D 0; i < OPL4_MAX_VOICES; i++) {
           ^
   sound/drivers/opl4/opl4_synth.c:343:7: note: Assuming 'chan' is equal to=
 field 'chan'
                   if (voice->chan =3D=3D chan) {
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/drivers/opl4/opl4_synth.c:343:3: note: '?' condition is false
                   if (voice->chan =3D=3D chan) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/drivers/opl4/opl4_synth.c:343:22: note: 'chan' is equal to field '=
chan'
                   if (voice->chan =3D=3D chan) {
                                      ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   sound/drivers/opl4/opl4_synth.c:343:3: note: '?' condition is true
                   if (voice->chan =3D=3D chan) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   sound/drivers/opl4/opl4_synth.c:343:3: note: Taking true branch
                   if (voice->chan =3D=3D chan) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/drivers/opl4/opl4_synth.c:344:4: note: Calling 'snd_opl4_update_pi=
tch'

vim +/tx_ring +152 drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c

1e846c7aeb067f Marc Kleine-Budde 2021-05-21  146  =

1e846c7aeb067f Marc Kleine-Budde 2021-05-21  147  static inline int
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  148  mcp251xfd_tef_obj_read(co=
nst struct mcp251xfd_priv *priv,
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  149  		       struct mcp251xfd=
_hw_tef_obj *hw_tef_obj,
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  150  		       const u8 offset,=
 const u8 len)
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  151  {
1e846c7aeb067f Marc Kleine-Budde 2021-05-21 @152  	const struct mcp251xfd_t=
x_ring *tx_ring =3D priv->tx;
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  153  	const int val_bytes =3D =
regmap_get_val_bytes(priv->map_rx);
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  154  =

1e846c7aeb067f Marc Kleine-Budde 2021-05-21  155  	if (IS_ENABLED(CONFIG_CA=
N_MCP251XFD_SANITY) &&
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  156  	    (offset > tx_ring->o=
bj_num ||
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  157  	     len > tx_ring->obj_=
num ||
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  158  	     offset + len > tx_r=
ing->obj_num)) {
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  159  		netdev_err(priv->ndev,
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  160  			   "Trying to read too=
 many TEF objects (max=3D%d, offset=3D%d, len=3D%d).\n",
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  161  			   tx_ring->obj_num, o=
ffset, len);
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  162  		return -ERANGE;
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  163  	}
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  164  =

1e846c7aeb067f Marc Kleine-Budde 2021-05-21  165  	return regmap_bulk_read(=
priv->map_rx,
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  166  				mcp251xfd_get_tef_obj=
_addr(offset),
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  167  				hw_tef_obj,
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  168  				sizeof(*hw_tef_obj) /=
 val_bytes * len);
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  169  }
1e846c7aeb067f Marc Kleine-Budde 2021-05-21  170  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3863001414691941117==--

