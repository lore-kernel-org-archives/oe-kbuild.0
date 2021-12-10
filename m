Content-Type: multipart/mixed; boundary="===============5322263769814517450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/firewire/amdtp-stream.c:799:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sat, 11 Dec 2021 00:31:02 +0800
Message-ID: <202112110007.WcfiHmVF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5322263769814517450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c741e49150dbb0c0aebe234389f4aa8b47958fa8
commit: 8070d2652e735585d31a50ff4f9bbaf2b5a49b10 ALSA: firewire-lib: add fl=
ag to unaware of syt in CIP header
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-c007-20211209 (https://download.01.org/0day-ci/ar=
chive/20211211/202112110007.WcfiHmVF-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8070d2652e735585d31a50ff4f9bbaf2b5a49b10
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8070d2652e735585d31a50ff4f9bbaf2b5a49b10
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   sound/core/timer.c:1251:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:628:13: note: expanded from macro 'list_for_each_en=
try'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   sound/core/timer.c:1251:2: note: Loop condition is true.  Entering loop =
body
           list_for_each_entry(timer, &snd_timer_list, device_list) {
           ^
   include/linux/list.h:628:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   sound/core/timer.c:1252:7: note: Assuming field 'card' is null
                   if (timer->card && timer->card->shutdown)
                       ^~~~~~~~~~~
   sound/core/timer.c:1252:19: note: Left side of '&&' is false
                   if (timer->card && timer->card->shutdown)
                                   ^
   sound/core/timer.c:1254:3: note: Control jumps to 'case SNDRV_TIMER_CLAS=
S_PCM:'  at line 1262
                   switch (timer->tmr_class) {
                   ^
   sound/core/timer.c:1263:39: note: Access to field 'number' results in a =
dereference of a null pointer (loaded from field 'card')
                           snd_iprintf(buffer, "P%i-%i-%i: ", timer->card->=
number,
                                                              ^
   include/sound/info.h:107:54: note: expanded from macro 'snd_iprintf'
           seq_printf((struct seq_file *)(buf)->buffer, fmt, ##args)
                                                               ^~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
>> sound/firewire/amdtp-stream.c:799:13: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]
                   desc->syt =3D syt;
                             ^
   sound/firewire/amdtp-stream.c:1113:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1113:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1120:9: note: Assuming 'offset' is < 'pack=
ets'
           while (offset < packets) {
                  ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1120:2: note: Loop condition is true.  Ent=
ering loop body
           while (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1123:3: note: Taking true branch
                   if (compare_ohci_cycle_count(cycle, d->processing_cycle.=
tx_start) >=3D 0)
                   ^
   sound/firewire/amdtp-stream.c:1124:4: note:  Execution continues on line=
 1130
                           break;
                           ^
   sound/firewire/amdtp-stream.c:1132:6: note: 'offset' is <=3D 0
           if (offset > 0) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1132:2: note: Taking false branch
           if (offset > 0) {
           ^
   sound/firewire/amdtp-stream.c:1143:6: note: 'offset' is < 'packets'
           if (offset < packets) {
               ^~~~~~
   sound/firewire/amdtp-stream.c:1143:2: note: Taking true branch
           if (offset < packets) {
           ^
   sound/firewire/amdtp-stream.c:1147:3: note: Calling 'process_tx_packets'
                   process_tx_packets(context, tstamp, header_length, ctx_h=
eader, s);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   sound/firewire/amdtp-stream.c:1049:6: note: Assuming field 'packet_index=
' is >=3D 0
           if (s->packet_index < 0)
               ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:1049:2: note: Taking false branch
           if (s->packet_index < 0)
           ^
   sound/firewire/amdtp-stream.c:1056:8: note: Calling 'generate_device_pkt=
_descs'
           err =3D generate_device_pkt_descs(s, s->pkt_descs, ctx_header, p=
ackets, &desc_count);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:750:14: note: Assuming 'i' is < 'packets'
           for (i =3D 0; i < packets; ++i) {
                       ^~~~~~~~~~~
   sound/firewire/amdtp-stream.c:750:2: note: Loop condition is true.  Ente=
ring loop body
           for (i =3D 0; i < packets; ++i) {
           ^
   sound/firewire/amdtp-stream.c:755:3: note: 'syt' declared without an ini=
tial value
                   unsigned int syt;
                   ^~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:758:11: note: Assuming 'next_cycle' is equ=
al to 'cycle'
                   lost =3D (next_cycle !=3D cycle);
                           ^~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:759:7: note: 'lost' is false
                   if (lost) {
                       ^~~~
   sound/firewire/amdtp-stream.c:759:3: note: Taking false branch
                   if (lost) {
                   ^
   sound/firewire/amdtp-stream.c:793:9: note: Calling 'parse_ir_ctx_header'
                   err =3D parse_ir_ctx_header(s, cycle, ctx_header, &data_=
blocks, &dbc, &syt,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:656:6: note: Assuming the condition is true
           if (!(s->flags & CIP_NO_HEADER))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:656:2: note: Taking true branch
           if (!(s->flags & CIP_NO_HEADER))
           ^
   sound/firewire/amdtp-stream.c:661:6: note: Assuming the condition is fal=
se
           if (payload_length > cip_header_size + s->ctx_data.tx.max_ctx_pa=
yload_length) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:661:2: note: Taking false branch
           if (payload_length > cip_header_size + s->ctx_data.tx.max_ctx_pa=
yload_length) {
           ^
   sound/firewire/amdtp-stream.c:668:6: note: 'cip_header_size' is > 0
           if (cip_header_size > 0) {
               ^~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:668:2: note: Taking true branch
           if (cip_header_size > 0) {
           ^
   sound/firewire/amdtp-stream.c:669:7: note: Assuming 'payload_length' is =
>=3D 'cip_header_size'
                   if (payload_length >=3D cip_header_size) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:669:3: note: Taking true branch
                   if (payload_length >=3D cip_header_size) {
                   ^
   sound/firewire/amdtp-stream.c:673:10: note: Calling 'check_cip_header'
                           err =3D check_cip_header(s, cip_header, payload_=
length - cip_header_size,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:568:8: note: Assuming the condition is fal=
se
           if ((((cip_header[0] & CIP_EOH_MASK) =3D=3D CIP_EOH) ||
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/firewire/amdtp-stream.c:568:7: note: Left side of '||' is false
           if ((((cip_header[0] & CIP_EOH_MASK) =3D=3D CIP_EOH) ||
                ^
   sound/firewire/amdtp-stream.c:569:8: note: Assuming the condition is fal=
se
                ((cip_header[1] & CIP_EOH_MASK) !=3D CIP_EOH)) &&

vim +799 sound/firewire/amdtp-stream.c

26cd1e5850b70b4 Takashi Sakamoto 2019-05-21  735  =

753e717986c24b6 Takashi Sakamoto 2019-07-22  736  static int generate_devic=
e_pkt_descs(struct amdtp_stream *s,
753e717986c24b6 Takashi Sakamoto 2019-07-22  737  				     struct pkt_desc =
*descs,
753e717986c24b6 Takashi Sakamoto 2019-07-22  738  				     const __be32 *ct=
x_header,
73246fc4c990da6 Takashi Sakamoto 2021-05-18  739  				     unsigned int pac=
kets,
73246fc4c990da6 Takashi Sakamoto 2021-05-18  740  				     unsigned int *de=
sc_count)
753e717986c24b6 Takashi Sakamoto 2019-07-22  741  {
705794c53b0080d Takashi Sakamoto 2021-05-18  742  	unsigned int next_cycle =
=3D s->next_cycle;
753e717986c24b6 Takashi Sakamoto 2019-07-22  743  	unsigned int dbc =3D s->=
data_block_counter;
814b43127f4ac69 Takashi Sakamoto 2021-05-13  744  	unsigned int packet_inde=
x =3D s->packet_index;
814b43127f4ac69 Takashi Sakamoto 2021-05-13  745  	unsigned int queue_size =
=3D s->queue_size;
753e717986c24b6 Takashi Sakamoto 2019-07-22  746  	int i;
753e717986c24b6 Takashi Sakamoto 2019-07-22  747  	int err;
753e717986c24b6 Takashi Sakamoto 2019-07-22  748  =

73246fc4c990da6 Takashi Sakamoto 2021-05-18  749  	*desc_count =3D 0;
753e717986c24b6 Takashi Sakamoto 2019-07-22  750  	for (i =3D 0; i < packet=
s; ++i) {
73246fc4c990da6 Takashi Sakamoto 2021-05-18  751  		struct pkt_desc *desc =
=3D descs + *desc_count;
753e717986c24b6 Takashi Sakamoto 2019-07-22  752  		unsigned int cycle;
705794c53b0080d Takashi Sakamoto 2021-05-18  753  		bool lost;
753e717986c24b6 Takashi Sakamoto 2019-07-22  754  		unsigned int data_block=
s;
753e717986c24b6 Takashi Sakamoto 2019-07-22  755  		unsigned int syt;
753e717986c24b6 Takashi Sakamoto 2019-07-22  756  =

3e106f4f690ef0c Takashi Sakamoto 2021-05-18  757  		cycle =3D compute_ohci_=
cycle_count(ctx_header[1]);
705794c53b0080d Takashi Sakamoto 2021-05-18  758  		lost =3D (next_cycle !=
=3D cycle);
705794c53b0080d Takashi Sakamoto 2021-05-18  759  		if (lost) {
705794c53b0080d Takashi Sakamoto 2021-05-18  760  			if (s->flags & CIP_NO_=
HEADER) {
705794c53b0080d Takashi Sakamoto 2021-05-18  761  				// Fireface skips tra=
nsmission just for an isoc cycle corresponding
705794c53b0080d Takashi Sakamoto 2021-05-18  762  				// to empty packet.
73246fc4c990da6 Takashi Sakamoto 2021-05-18  763  				unsigned int prev_cyc=
le =3D next_cycle;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  764  =

705794c53b0080d Takashi Sakamoto 2021-05-18  765  				next_cycle =3D increm=
ent_ohci_cycle_count(next_cycle, 1);
705794c53b0080d Takashi Sakamoto 2021-05-18  766  				lost =3D (next_cycle =
!=3D cycle);
73246fc4c990da6 Takashi Sakamoto 2021-05-18  767  				if (!lost) {
73246fc4c990da6 Takashi Sakamoto 2021-05-18  768  					// Prepare a descrip=
tion for the skipped cycle for
73246fc4c990da6 Takashi Sakamoto 2021-05-18  769  					// sequence replay.
73246fc4c990da6 Takashi Sakamoto 2021-05-18  770  					desc->cycle =3D prev=
_cycle;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  771  					desc->syt =3D 0;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  772  					desc->data_blocks =
=3D 0;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  773  					desc->data_block_cou=
nter =3D dbc;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  774  					desc->ctx_payload =
=3D NULL;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  775  					++desc;
73246fc4c990da6 Takashi Sakamoto 2021-05-18  776  					++(*desc_count);
73246fc4c990da6 Takashi Sakamoto 2021-05-18  777  				}
705794c53b0080d Takashi Sakamoto 2021-05-18  778  			} else if (s->flags & =
CIP_JUMBO_PAYLOAD) {
705794c53b0080d Takashi Sakamoto 2021-05-18  779  				// OXFW970 skips tran=
smission for several isoc cycles during
73246fc4c990da6 Takashi Sakamoto 2021-05-18  780  				// asynchronous trans=
action. The sequence replay is impossible due
73246fc4c990da6 Takashi Sakamoto 2021-05-18  781  				// to the reason.
705794c53b0080d Takashi Sakamoto 2021-05-18  782  				unsigned int safe_cyc=
le =3D increment_ohci_cycle_count(next_cycle,
705794c53b0080d Takashi Sakamoto 2021-05-18  783  								IR_JUMBO_PAYLOAD_=
MAX_SKIP_CYCLES);
705794c53b0080d Takashi Sakamoto 2021-05-18  784  				lost =3D (compare_ohc=
i_cycle_count(safe_cycle, cycle) > 0);
705794c53b0080d Takashi Sakamoto 2021-05-18  785  			}
705794c53b0080d Takashi Sakamoto 2021-05-18  786  			if (lost) {
705794c53b0080d Takashi Sakamoto 2021-05-18  787  				dev_err(&s->unit->dev=
ice, "Detect discontinuity of cycle: %d %d\n",
705794c53b0080d Takashi Sakamoto 2021-05-18  788  					next_cycle, cycle);
705794c53b0080d Takashi Sakamoto 2021-05-18  789  				return -EIO;
705794c53b0080d Takashi Sakamoto 2021-05-18  790  			}
705794c53b0080d Takashi Sakamoto 2021-05-18  791  		}
753e717986c24b6 Takashi Sakamoto 2019-07-22  792  =

ebd2a647e2f6b96 Takashi Sakamoto 2021-05-18  793  		err =3D parse_ir_ctx_he=
ader(s, cycle, ctx_header, &data_blocks, &dbc, &syt,
ebd2a647e2f6b96 Takashi Sakamoto 2021-05-18  794  					  packet_index, i);
753e717986c24b6 Takashi Sakamoto 2019-07-22  795  		if (err < 0)
753e717986c24b6 Takashi Sakamoto 2019-07-22  796  			return err;
753e717986c24b6 Takashi Sakamoto 2019-07-22  797  =

753e717986c24b6 Takashi Sakamoto 2019-07-22  798  		desc->cycle =3D cycle;
753e717986c24b6 Takashi Sakamoto 2019-07-22 @799  		desc->syt =3D syt;
753e717986c24b6 Takashi Sakamoto 2019-07-22  800  		desc->data_blocks =3D d=
ata_blocks;
753e717986c24b6 Takashi Sakamoto 2019-07-22  801  		desc->data_block_counte=
r =3D dbc;
814b43127f4ac69 Takashi Sakamoto 2021-05-13  802  		desc->ctx_payload =3D s=
->buffer.packets[packet_index].buffer;
753e717986c24b6 Takashi Sakamoto 2019-07-22  803  =

753e717986c24b6 Takashi Sakamoto 2019-07-22  804  		if (!(s->flags & CIP_DB=
C_IS_END_EVENT))
753e717986c24b6 Takashi Sakamoto 2019-07-22  805  			dbc =3D (dbc + desc->d=
ata_blocks) & 0xff;
753e717986c24b6 Takashi Sakamoto 2019-07-22  806  =

705794c53b0080d Takashi Sakamoto 2021-05-18  807  		next_cycle =3D incremen=
t_ohci_cycle_count(next_cycle, 1);
73246fc4c990da6 Takashi Sakamoto 2021-05-18  808  		++(*desc_count);
705794c53b0080d Takashi Sakamoto 2021-05-18  809  		ctx_header +=3D s->ctx_=
data.tx.ctx_header_size / sizeof(*ctx_header);
814b43127f4ac69 Takashi Sakamoto 2021-05-13  810  		packet_index =3D (packe=
t_index + 1) % queue_size;
753e717986c24b6 Takashi Sakamoto 2019-07-22  811  	}
753e717986c24b6 Takashi Sakamoto 2019-07-22  812  =

705794c53b0080d Takashi Sakamoto 2021-05-18  813  	s->next_cycle =3D next_c=
ycle;
753e717986c24b6 Takashi Sakamoto 2019-07-22  814  	s->data_block_counter =
=3D dbc;
753e717986c24b6 Takashi Sakamoto 2019-07-22  815  =

753e717986c24b6 Takashi Sakamoto 2019-07-22  816  	return 0;
753e717986c24b6 Takashi Sakamoto 2019-07-22  817  }
753e717986c24b6 Takashi Sakamoto 2019-07-22  818  =


:::::: The code at line 799 was first introduced by commit
:::::: 753e717986c24b60962367708479555212730b9f ALSA: firewire-lib: use pac=
ket descriptor for IR context

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5322263769814517450==--

