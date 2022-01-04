Content-Type: multipart/mixed; boundary="===============3037926089583866165=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/google/gve/gve_tx_dqo.c:619:17: warning: Division by zero [clang-analyzer-core.DivideZero]
Date: Tue, 04 Jan 2022 08:34:10 +0800
Message-ID: <202201040835.cHH9Icmo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3037926089583866165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Bailey Forrest <bcf@google.com>
CC: Willem de Bruijn <willemb@google.com>
CC: Catherine Sullivan <csully@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c9e6606c7fe92b50a02ce51dda82586ebdf99b48
commit: a57e5de476be0b4b7f42beb6a21c19ad9c577aa3 gve: DQO: Add TX path
date:   6 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-c007-20220102 (https://download.01.org/0day-ci/ar=
chive/20220104/202201040835.cHH9Icmo-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 104a82=
7ea6de0cbe0f5faef4407552ede31d165c)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Da57e5de476be0b4b7f42beb6a21c19ad9c577aa3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a57e5de476be0b4b7f42beb6a21c19ad9c577aa3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                                   ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:294:4: note: Taking false branch
                           if (cell =3D=3D f->tail)
                           ^
   sound/core/seq/seq_prioq.c:299:8: note: 'freefirst' is equal to NULL
                           if (freefirst =3D=3D NULL) {
                               ^~~~~~~~~
   sound/core/seq/seq_prioq.c:299:4: note: Taking true branch
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:294:4: note: Taking false branch
                           if (cell =3D=3D f->tail)
                           ^
   sound/core/seq/seq_prioq.c:299:8: note: 'freefirst' is not equal to NULL
                           if (freefirst =3D=3D NULL) {
                               ^~~~~~~~~
   sound/core/seq/seq_prioq.c:299:4: note: Taking false branch
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:7: note: Assuming the condition is true
                   if (prioq_match(cell, client, timestamp)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: 'cell' is equal to field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking true branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:294:8: note: Assuming 'cell' is not equal to =
field 'tail'
                           if (cell =3D=3D f->tail)
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:294:4: note: Taking false branch
                           if (cell =3D=3D f->tail)
                           ^
   sound/core/seq/seq_prioq.c:299:8: note: 'freefirst' is not equal to NULL
                           if (freefirst =3D=3D NULL) {
                               ^~~~~~~~~
   sound/core/seq/seq_prioq.c:299:4: note: Taking false branch
                           if (freefirst =3D=3D NULL) {
                           ^
   sound/core/seq/seq_prioq.c:285:2: note: Loop condition is true.  Enterin=
g loop body
           while (cell) {
           ^
   sound/core/seq/seq_prioq.c:287:7: note: Assuming the condition is true
                   if (prioq_match(cell, client, timestamp)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:287:3: note: Taking true branch
                   if (prioq_match(cell, client, timestamp)) {
                   ^
   sound/core/seq/seq_prioq.c:289:8: note: Assuming 'cell' is not equal to =
field 'head'
                           if (cell =3D=3D f->head) {
                               ^~~~~~~~~~~~~~~
   sound/core/seq/seq_prioq.c:289:4: note: Taking false branch
                           if (cell =3D=3D f->head) {
                           ^
   sound/core/seq/seq_prioq.c:292:16: note: Access to field 'next' results =
in a dereference of a null pointer (loaded from variable 'prev')
                                   prev->next =3D cell->next;
                                   ~~~~       ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/net/ethernet/google/gve/gve_tx_dqo.c:619:17: warning: Division b=
y zero [clang-analyzer-core.DivideZero]
                           cur_seg_size %=3D gso_size;
                                        ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:693:15: note: Calling 'gve_=
try_tx_skb'
           if (unlikely(gve_try_tx_skb(priv, tx, skb) < 0)) {
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:643:6: note: Assuming the c=
ondition is true
           if (skb_is_gso(skb)) {
               ^~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:643:2: note: Taking true br=
anch
           if (skb_is_gso(skb)) {
           ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:647:17: note: Calling 'gve_=
can_send_tso'
                   if (unlikely(!gve_can_send_tso(skb) &&
                                 ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:609:2: note: 'gso_size' ini=
tialized here
           const int gso_size =3D shinfo->gso_size;
           ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:615:21: note: Assuming 'cur=
_seg_size' is <=3D 0
           cur_seg_num_bufs =3D cur_seg_size > 0;
                              ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:617:14: note: Assuming 'i' =
is < field 'nr_frags'
           for (i =3D 0; i < shinfo->nr_frags; i++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:617:2: note: Loop condition=
 is true.  Entering loop body
           for (i =3D 0; i < shinfo->nr_frags; i++) {
           ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:618:7: note: Assuming 'cur_=
seg_size' is >=3D 'gso_size'
                   if (cur_seg_size >=3D gso_size) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:618:3: note: Taking true br=
anch
                   if (cur_seg_size >=3D gso_size) {
                   ^
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:619:17: note: Division by z=
ero
                           cur_seg_size %=3D gso_size;
                           ~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:732:2: warning: Value store=
d to 'index' is never read [clang-analyzer-deadcode.DeadStores]
           index =3D pending_packet - tx->dqo.pending_packets;
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_tx_dqo.c:732:2: note: Value stored t=
o 'index' is never read
           index =3D pending_packet - tx->dqo.pending_packets;
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
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
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/pci/oxygen/oxygen_lib.c:666:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->driver, chip->model.chip);
           ^~~~~~
   sound/pci/oxygen/oxygen_lib.c:666:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(card->driver, chip->model.chip);
           ^~~~~~
   sound/pci/oxygen/oxygen_lib.c:667:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, chip->model.shortname);
           ^~~~~~
   sound/pci/oxygen/oxygen_lib.c:667:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(card->shortname, chip->model.shortname);
           ^~~~~~
   sound/pci/oxygen/oxygen_lib.c:670:2: warning: Call to function 'strcpy' =
is insecure as it does not provide bounding of the memory buffer. Replace u=
nbounded copy functions with analogous functions that support length argume=
nts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, chip->model.chip);
           ^~~~~~
   sound/pci/oxygen/oxygen_lib.c:670:2: note: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119
           strcpy(card->mixername, chip->model.chip);
           ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/base/regmap/regcache.c:137:7: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
                   if (config->reg_defaults[i].reg % map->reg_stride)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:6: note: Assuming field 'cache_type' =
is not equal to REGCACHE_NONE
           if (map->cache_type =3D=3D REGCACHE_NONE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/regmap/regcache.c:121:2: note: Taking false branch
           if (map->cache_type =3D=3D REGCACHE_NONE) {
           ^
   drivers/base/regmap/regcache.c:130:6: note: Assuming field 'reg_defaults=
' is null
           if (config->reg_defaults && !config->num_reg_defaults) {

vim +619 drivers/net/ethernet/google/gve/gve_tx_dqo.c

a57e5de476be0b4 Bailey Forrest 2021-06-24  596  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  597  /* Returns true if HW is ca=
pable of sending TSO represented by `skb`.
a57e5de476be0b4 Bailey Forrest 2021-06-24  598   *
a57e5de476be0b4 Bailey Forrest 2021-06-24  599   * Each segment must not sp=
an more than GVE_TX_MAX_DATA_DESCS buffers.
a57e5de476be0b4 Bailey Forrest 2021-06-24  600   * - The header is counted =
as one buffer for every single segment.
a57e5de476be0b4 Bailey Forrest 2021-06-24  601   * - A buffer which is spli=
t between two segments is counted for both.
a57e5de476be0b4 Bailey Forrest 2021-06-24  602   * - If a buffer contains b=
oth header and payload, it is counted as two buffers.
a57e5de476be0b4 Bailey Forrest 2021-06-24  603   */
a57e5de476be0b4 Bailey Forrest 2021-06-24  604  static bool gve_can_send_ts=
o(const struct sk_buff *skb)
a57e5de476be0b4 Bailey Forrest 2021-06-24  605  {
a57e5de476be0b4 Bailey Forrest 2021-06-24  606  	const int header_len =3D s=
kb_checksum_start_offset(skb) + tcp_hdrlen(skb);
a57e5de476be0b4 Bailey Forrest 2021-06-24  607  	const int max_bufs_per_seg=
 =3D GVE_TX_MAX_DATA_DESCS - 1;
a57e5de476be0b4 Bailey Forrest 2021-06-24  608  	const struct skb_shared_in=
fo *shinfo =3D skb_shinfo(skb);
a57e5de476be0b4 Bailey Forrest 2021-06-24  609  	const int gso_size =3D shi=
nfo->gso_size;
a57e5de476be0b4 Bailey Forrest 2021-06-24  610  	int cur_seg_num_bufs;
a57e5de476be0b4 Bailey Forrest 2021-06-24  611  	int cur_seg_size;
a57e5de476be0b4 Bailey Forrest 2021-06-24  612  	int i;
a57e5de476be0b4 Bailey Forrest 2021-06-24  613  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  614  	cur_seg_size =3D skb_headl=
en(skb) - header_len;
a57e5de476be0b4 Bailey Forrest 2021-06-24  615  	cur_seg_num_bufs =3D cur_s=
eg_size > 0;
a57e5de476be0b4 Bailey Forrest 2021-06-24  616  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  617  	for (i =3D 0; i < shinfo->=
nr_frags; i++) {
a57e5de476be0b4 Bailey Forrest 2021-06-24  618  		if (cur_seg_size >=3D gso=
_size) {
a57e5de476be0b4 Bailey Forrest 2021-06-24 @619  			cur_seg_size %=3D gso_si=
ze;
a57e5de476be0b4 Bailey Forrest 2021-06-24  620  			cur_seg_num_bufs =3D cur=
_seg_size > 0;
a57e5de476be0b4 Bailey Forrest 2021-06-24  621  		}
a57e5de476be0b4 Bailey Forrest 2021-06-24  622  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  623  		if (unlikely(++cur_seg_nu=
m_bufs > max_bufs_per_seg))
a57e5de476be0b4 Bailey Forrest 2021-06-24  624  			return false;
a57e5de476be0b4 Bailey Forrest 2021-06-24  625  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  626  		cur_seg_size +=3D skb_fra=
g_size(&shinfo->frags[i]);
a57e5de476be0b4 Bailey Forrest 2021-06-24  627  	}
a57e5de476be0b4 Bailey Forrest 2021-06-24  628  =

a57e5de476be0b4 Bailey Forrest 2021-06-24  629  	return true;
a57e5de476be0b4 Bailey Forrest 2021-06-24  630  }
a57e5de476be0b4 Bailey Forrest 2021-06-24  631  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3037926089583866165==--

