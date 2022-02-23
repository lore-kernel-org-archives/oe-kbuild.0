Content-Type: multipart/mixed; boundary="===============6428304363123943550=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/firewire/amdtp-stream.c:799:13: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Wed, 23 Feb 2022 14:42:15 +0800
Message-ID: <202202231411.6JliOeNh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6428304363123943550==
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
head:   5c1ee569660d4a205dced9cb4d0306b907fb7599
commit: 8070d2652e735585d31a50ff4f9bbaf2b5a49b10 ALSA: firewire-lib: add fl=
ag to unaware of syt in CIP header
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220222 (https://download.01.org/0day-ci/archi=
ve/20220223/202202231411.6JliOeNh-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8070d2652e735585d31a50ff4f9bbaf2b5a49b10
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8070d2652e735585d31a50ff4f9bbaf2b5a49b10
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   include/linux/mtd/map.h:313:7: note: expanded from macro 'map_word_bitss=
et'
                   if ((val1).x[i] & (val2).x[i]) {                        \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Taking false branch
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:313:3: note: expanded from macro 'map_word_bitss=
et'
                   if ((val1).x[i] & (val2).x[i]) {                        \
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:6: note: Loop condition is fals=
e. Execution continues on line 1753
           if (map_word_bitsset(map, status, CMD(0x30))) {
               ^
   include/linux/mtd/map.h:312:2: note: expanded from macro 'map_word_bitss=
et'
           for (i =3D 0; i < map_words(map); i++) {                        =
  \
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1753:2: note: Taking false branch
           if (map_word_bitsset(map, status, CMD(0x30))) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1764:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1764:2: note: Taking false branch
           if (ret) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1781:6: note: Assuming 'word_gap' is=
 not equal to 0
           if (!word_gap) {
               ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1781:2: note: Taking false branch
           if (!word_gap) {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:7: note: Assuming the condition=
 is false
                   if (n > vec->iov_len - vec_seek)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:3: note: Taking false branch
                   if (n > vec->iov_len - vec_seek)
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1799:7: note: Assuming 'n' is <=3D '=
len'
                   if (n > len)
                       ^~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1799:3: note: Taking false branch
                   if (n > len)
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1802:7: note: Assuming 'word_gap' is=
 not equal to 0
                   if (!word_gap && len < map_bankwidth(map))
                       ^~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1802:17: note: Left side of '&&' is =
false
                   if (!word_gap && len < map_bankwidth(map))
                                 ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:7: note: Assuming 'len' is not =
equal to 0
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                       ^~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:7: note: Left side of '||' is f=
alse
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:15: note: Assuming 'word_gap' i=
s not equal to field 'bankwidth'
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1811:3: note: Taking false branch
                   if (!len || word_gap =3D=3D map_bankwidth(map)) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1818:7: note: Assuming 'vec_seek' is=
 equal to field 'iov_len'
                   if (vec_seek =3D=3D vec->iov_len) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/chips/cfi_cmdset_0001.c:1818:3: note: Taking true branch
                   if (vec_seek =3D=3D vec->iov_len) {
                   ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1795:2: note: Loop condition is true=
. Execution continues on line 1796
           do {
           ^
   drivers/mtd/chips/cfi_cmdset_0001.c:1797:24: note: The left operand of '=
-' is a garbage value
                   if (n > vec->iov_len - vec_seek)
                           ~~~~~~~~~~~~ ^
   2 warnings generated.
   sound/drivers/mpu401/mpu401.c:67:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:67:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(card->longname, "polled");
                   ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(card->longname, "polled");
                   ^~~~~~
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
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

26cd1e5850b70b Takashi Sakamoto 2019-05-21  735  =

753e717986c24b Takashi Sakamoto 2019-07-22  736  static int generate_device=
_pkt_descs(struct amdtp_stream *s,
753e717986c24b Takashi Sakamoto 2019-07-22  737  				     struct pkt_desc *=
descs,
753e717986c24b Takashi Sakamoto 2019-07-22  738  				     const __be32 *ctx=
_header,
73246fc4c990da Takashi Sakamoto 2021-05-18  739  				     unsigned int pack=
ets,
73246fc4c990da Takashi Sakamoto 2021-05-18  740  				     unsigned int *des=
c_count)
753e717986c24b Takashi Sakamoto 2019-07-22  741  {
705794c53b0080 Takashi Sakamoto 2021-05-18  742  	unsigned int next_cycle =
=3D s->next_cycle;
753e717986c24b Takashi Sakamoto 2019-07-22  743  	unsigned int dbc =3D s->d=
ata_block_counter;
814b43127f4ac6 Takashi Sakamoto 2021-05-13  744  	unsigned int packet_index=
 =3D s->packet_index;
814b43127f4ac6 Takashi Sakamoto 2021-05-13  745  	unsigned int queue_size =
=3D s->queue_size;
753e717986c24b Takashi Sakamoto 2019-07-22  746  	int i;
753e717986c24b Takashi Sakamoto 2019-07-22  747  	int err;
753e717986c24b Takashi Sakamoto 2019-07-22  748  =

73246fc4c990da Takashi Sakamoto 2021-05-18  749  	*desc_count =3D 0;
753e717986c24b Takashi Sakamoto 2019-07-22  750  	for (i =3D 0; i < packets=
; ++i) {
73246fc4c990da Takashi Sakamoto 2021-05-18  751  		struct pkt_desc *desc =
=3D descs + *desc_count;
753e717986c24b Takashi Sakamoto 2019-07-22  752  		unsigned int cycle;
705794c53b0080 Takashi Sakamoto 2021-05-18  753  		bool lost;
753e717986c24b Takashi Sakamoto 2019-07-22  754  		unsigned int data_blocks;
753e717986c24b Takashi Sakamoto 2019-07-22  755  		unsigned int syt;
753e717986c24b Takashi Sakamoto 2019-07-22  756  =

3e106f4f690ef0 Takashi Sakamoto 2021-05-18  757  		cycle =3D compute_ohci_c=
ycle_count(ctx_header[1]);
705794c53b0080 Takashi Sakamoto 2021-05-18  758  		lost =3D (next_cycle !=
=3D cycle);
705794c53b0080 Takashi Sakamoto 2021-05-18  759  		if (lost) {
705794c53b0080 Takashi Sakamoto 2021-05-18  760  			if (s->flags & CIP_NO_H=
EADER) {
705794c53b0080 Takashi Sakamoto 2021-05-18  761  				// Fireface skips tran=
smission just for an isoc cycle corresponding
705794c53b0080 Takashi Sakamoto 2021-05-18  762  				// to empty packet.
73246fc4c990da Takashi Sakamoto 2021-05-18  763  				unsigned int prev_cycl=
e =3D next_cycle;
73246fc4c990da Takashi Sakamoto 2021-05-18  764  =

705794c53b0080 Takashi Sakamoto 2021-05-18  765  				next_cycle =3D increme=
nt_ohci_cycle_count(next_cycle, 1);
705794c53b0080 Takashi Sakamoto 2021-05-18  766  				lost =3D (next_cycle !=
=3D cycle);
73246fc4c990da Takashi Sakamoto 2021-05-18  767  				if (!lost) {
73246fc4c990da Takashi Sakamoto 2021-05-18  768  					// Prepare a descript=
ion for the skipped cycle for
73246fc4c990da Takashi Sakamoto 2021-05-18  769  					// sequence replay.
73246fc4c990da Takashi Sakamoto 2021-05-18  770  					desc->cycle =3D prev_=
cycle;
73246fc4c990da Takashi Sakamoto 2021-05-18  771  					desc->syt =3D 0;
73246fc4c990da Takashi Sakamoto 2021-05-18  772  					desc->data_blocks =3D=
 0;
73246fc4c990da Takashi Sakamoto 2021-05-18  773  					desc->data_block_coun=
ter =3D dbc;
73246fc4c990da Takashi Sakamoto 2021-05-18  774  					desc->ctx_payload =3D=
 NULL;
73246fc4c990da Takashi Sakamoto 2021-05-18  775  					++desc;
73246fc4c990da Takashi Sakamoto 2021-05-18  776  					++(*desc_count);
73246fc4c990da Takashi Sakamoto 2021-05-18  777  				}
705794c53b0080 Takashi Sakamoto 2021-05-18  778  			} else if (s->flags & C=
IP_JUMBO_PAYLOAD) {
705794c53b0080 Takashi Sakamoto 2021-05-18  779  				// OXFW970 skips trans=
mission for several isoc cycles during
73246fc4c990da Takashi Sakamoto 2021-05-18  780  				// asynchronous transa=
ction. The sequence replay is impossible due
73246fc4c990da Takashi Sakamoto 2021-05-18  781  				// to the reason.
705794c53b0080 Takashi Sakamoto 2021-05-18  782  				unsigned int safe_cycl=
e =3D increment_ohci_cycle_count(next_cycle,
705794c53b0080 Takashi Sakamoto 2021-05-18  783  								IR_JUMBO_PAYLOAD_M=
AX_SKIP_CYCLES);
705794c53b0080 Takashi Sakamoto 2021-05-18  784  				lost =3D (compare_ohci=
_cycle_count(safe_cycle, cycle) > 0);
705794c53b0080 Takashi Sakamoto 2021-05-18  785  			}
705794c53b0080 Takashi Sakamoto 2021-05-18  786  			if (lost) {
705794c53b0080 Takashi Sakamoto 2021-05-18  787  				dev_err(&s->unit->devi=
ce, "Detect discontinuity of cycle: %d %d\n",
705794c53b0080 Takashi Sakamoto 2021-05-18  788  					next_cycle, cycle);
705794c53b0080 Takashi Sakamoto 2021-05-18  789  				return -EIO;
705794c53b0080 Takashi Sakamoto 2021-05-18  790  			}
705794c53b0080 Takashi Sakamoto 2021-05-18  791  		}
753e717986c24b Takashi Sakamoto 2019-07-22  792  =

ebd2a647e2f6b9 Takashi Sakamoto 2021-05-18  793  		err =3D parse_ir_ctx_hea=
der(s, cycle, ctx_header, &data_blocks, &dbc, &syt,
ebd2a647e2f6b9 Takashi Sakamoto 2021-05-18  794  					  packet_index, i);
753e717986c24b Takashi Sakamoto 2019-07-22  795  		if (err < 0)
753e717986c24b Takashi Sakamoto 2019-07-22  796  			return err;
753e717986c24b Takashi Sakamoto 2019-07-22  797  =

753e717986c24b Takashi Sakamoto 2019-07-22  798  		desc->cycle =3D cycle;
753e717986c24b Takashi Sakamoto 2019-07-22 @799  		desc->syt =3D syt;
753e717986c24b Takashi Sakamoto 2019-07-22  800  		desc->data_blocks =3D da=
ta_blocks;
753e717986c24b Takashi Sakamoto 2019-07-22  801  		desc->data_block_counter=
 =3D dbc;
814b43127f4ac6 Takashi Sakamoto 2021-05-13  802  		desc->ctx_payload =3D s-=
>buffer.packets[packet_index].buffer;
753e717986c24b Takashi Sakamoto 2019-07-22  803  =

753e717986c24b Takashi Sakamoto 2019-07-22  804  		if (!(s->flags & CIP_DBC=
_IS_END_EVENT))
753e717986c24b Takashi Sakamoto 2019-07-22  805  			dbc =3D (dbc + desc->da=
ta_blocks) & 0xff;
753e717986c24b Takashi Sakamoto 2019-07-22  806  =

705794c53b0080 Takashi Sakamoto 2021-05-18  807  		next_cycle =3D increment=
_ohci_cycle_count(next_cycle, 1);
73246fc4c990da Takashi Sakamoto 2021-05-18  808  		++(*desc_count);
705794c53b0080 Takashi Sakamoto 2021-05-18  809  		ctx_header +=3D s->ctx_d=
ata.tx.ctx_header_size / sizeof(*ctx_header);
814b43127f4ac6 Takashi Sakamoto 2021-05-13  810  		packet_index =3D (packet=
_index + 1) % queue_size;
753e717986c24b Takashi Sakamoto 2019-07-22  811  	}
753e717986c24b Takashi Sakamoto 2019-07-22  812  =

705794c53b0080 Takashi Sakamoto 2021-05-18  813  	s->next_cycle =3D next_cy=
cle;
753e717986c24b Takashi Sakamoto 2019-07-22  814  	s->data_block_counter =3D=
 dbc;
753e717986c24b Takashi Sakamoto 2019-07-22  815  =

753e717986c24b Takashi Sakamoto 2019-07-22  816  	return 0;
753e717986c24b Takashi Sakamoto 2019-07-22  817  }
753e717986c24b Takashi Sakamoto 2019-07-22  818  =


:::::: The code at line 799 was first introduced by commit
:::::: 753e717986c24b60962367708479555212730b9f ALSA: firewire-lib: use pac=
ket descriptor for IR context

:::::: TO: Takashi Sakamoto <o-takashi@sakamocchi.jp>
:::::: CC: Takashi Iwai <tiwai@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6428304363123943550==--

