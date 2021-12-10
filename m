Content-Type: multipart/mixed; boundary="===============8083395199342590538=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-rt-linux-5.10.y 7485/10213] net/hsr/hsr_device.c:387:19: warning: Value stored to 'hsr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 10 Dec 2021 15:10:00 +0800
Message-ID: <202112101516.2CEq5w00-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8083395199342590538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
TO: Murali Karicheri <m-karicheri2@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Kishon Vijay Abraham I <kishon@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
10.y
head:   541ec9a6995c3dd881d6f0b63cc714a08ded457d
commit: 46bd10a0a3c2a29437907681cafda860a72e86cf [7485/10213] net: hsr: Sup=
port VLAN tagged supervision frames
:::::: branch date: 7 days ago
:::::: commit date: 5 months ago
config: i386-randconfig-c001-20211209 (https://download.01.org/0day-ci/arch=
ive/20211210/202112101516.2CEq5w00-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 46bd10a0a3c2a29437907681cafda860a72e86cf
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:297:6: note: Assuming the conditio=
n is false
           if (buf[0] =3D=3D 0)
               ^~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:297:2: note: Taking false branch
           if (buf[0] =3D=3D 0)
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:301:6: note: Assuming 'len' is <=
=3D 'buflen'
           if (len > buflen)
               ^~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:301:2: note: Taking false branch
           if (len > buflen)
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:305:6: note: Assuming the conditio=
n is false
           if ((crc4 & 0xf) !=3D (buf[len - 1] & 0xf)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:305:2: note: Taking false branch
           if ((crc4 & 0xf) !=3D (buf[len - 1] & 0xf)) {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:313:14: note: Assuming the conditi=
on is false
           for (i =3D 0; i < (hdr->lct / 2); i++)
                       ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:313:2: note: Loop condition is fal=
se. Execution continues on line 315
           for (i =3D 0; i < (hdr->lct / 2); i++)
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3917:8: note: Returning from 'drm_=
dp_decode_sideband_msg_hdr'
           ret =3D drm_dp_decode_sideband_msg_hdr(&hdr, replyblock, len, &h=
drlen);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3918:6: note: 'ret' is not equal t=
o false
           if (ret =3D=3D false) {
               ^~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3918:2: note: Taking false branch
           if (ret =3D=3D false) {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3925:7: note: 'up' is false
           if (!up) {
                ^~
   drivers/gpu/drm/drm_dp_mst_topology.c:3925:2: note: Taking true branch
           if (!up) {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3927:11: note: Calling 'drm_dp_get=
_mst_branch_device'
                   *mstb =3D drm_dp_get_mst_branch_device(mgr, hdr.lct, hdr=
.rad);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:2601:6: note: Assuming 'mstb' is n=
on-null
           if (!mstb)
               ^~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:2601:2: note: Taking false branch
           if (!mstb)
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:2604:7: note: The value 0 is assig=
ned to 'i'
           for (i =3D 0; i < lct - 1; i++) {
                ^~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:2604:14: note: Assuming the condit=
ion is true
           for (i =3D 0; i < lct - 1; i++) {
                       ^~~~~~~~~~~
   drivers/gpu/drm/drm_dp_mst_topology.c:2604:2: note: Loop condition is tr=
ue.  Entering loop body
           for (i =3D 0; i < lct - 1; i++) {
           ^
   drivers/gpu/drm/drm_dp_mst_topology.c:2605:15: note: '?' condition is fa=
lse
                   int shift =3D (i % 2) ? 0 : 4;
                               ^
   drivers/gpu/drm/drm_dp_mst_topology.c:2606:30: note: The left operand of=
 '>>' is a garbage value
                   int port_num =3D (rad[i / 2] >> shift) & 0xf;
                                   ~~~~~~~~~~ ^
   drivers/gpu/drm/drm_dp_mst_topology.c:3292:2: warning: Value stored to '=
len' is never read [clang-analyzer-deadcode.DeadStores]
           len =3D build_query_stream_enc_status(txmsg, port->vcpi.vcpi, no=
nce);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/gpu/drm/drm_dp_mst_topology.c:3292:2: note: Value stored to 'len=
' is never read
           len =3D build_query_stream_enc_status(txmsg, port->vcpi.vcpi, no=
nce);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   Suppressed 5 warnings (4 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> net/hsr/hsr_device.c:387:19: warning: Value stored to 'hsr' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hsr_priv *hsr =3D master->hsr;
                            ^~~   ~~~~~~~~~~~
   net/hsr/hsr_device.c:387:19: note: Value stored to 'hsr' during its init=
ialization is never read
           struct hsr_priv *hsr =3D master->hsr;
                            ^~~   ~~~~~~~~~~~
   net/hsr/hsr_device.c:497:24: warning: Access to field 'sequence_nr' resu=
lts in a dereference of a null pointer (loaded from variable 'hsr_tag') [cl=
ang-analyzer-core.NullDereference]
                   hsr_tag->sequence_nr =3D htons(hsr->sequence_nr);
                   ~~~~~~~              ^
   net/hsr/hsr_device.c:445:2: note: 'hsr_tag' initialized to a null pointe=
r value
           struct hsr_tag *hsr_tag =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:455:6: note: Assuming field 'announce_count' is >=
=3D 3
           if (hsr->announce_count < 3 && hsr->prot_version =3D=3D 0) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:455:30: note: Left side of '&&' is false
           if (hsr->announce_count < 3 && hsr->prot_version =3D=3D 0) {
                                       ^
   net/hsr/hsr_device.c:461:6: note: Assuming field 'prot_version' is not e=
qual to 0
           if (!hsr->prot_version)
               ^~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:461:2: note: Taking false branch
           if (!hsr->prot_version)
           ^
   net/hsr/hsr_device.c:466:8: note: Calling 'hsr_init_skb'
           skb =3D hsr_init_skb(master, proto);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:394:6: note: Assuming field 'disable_sv_frame' is 0
           if (hsr->disable_sv_frame)
               ^~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:394:2: note: Taking false branch
           if (hsr->disable_sv_frame)
           ^
   net/hsr/hsr_device.c:403:6: note: Assuming field 'use_vlan_for_sv' is 0
           if (hsr->use_vlan_for_sv)
               ^~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:403:2: note: Taking false branch
           if (hsr->use_vlan_for_sv)
           ^
   net/hsr/hsr_device.c:411:6: note: Assuming 'skb' is non-null, which part=
icipates in a condition later
           if (!skb)
               ^~~~
   net/hsr/hsr_device.c:411:2: note: Taking false branch
           if (!skb)
           ^
   net/hsr/hsr_device.c:416:11: note: Field 'use_vlan_for_sv' is 0
           if (hsr->use_vlan_for_sv) {
                    ^
   net/hsr/hsr_device.c:416:2: note: Taking false branch
           if (hsr->use_vlan_for_sv) {
           ^
   net/hsr/hsr_device.c:424:6: note: Assuming the condition is false
           if (dev_hard_header(skb, skb->dev, proto,
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:424:2: note: Taking false branch
           if (dev_hard_header(skb, skb->dev, proto,
           ^
   net/hsr/hsr_device.c:433:2: note: Returning pointer (loaded from 'skb'),=
 which participates in a condition later
           return skb;
           ^~~~~~~~~~
   net/hsr/hsr_device.c:466:8: note: Returning from 'hsr_init_skb'
           skb =3D hsr_init_skb(master, proto);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:467:7: note: 'skb' is non-null
           if (!skb) {
                ^~~
   net/hsr/hsr_device.c:467:2: note: Taking false branch
           if (!skb) {
           ^
   net/hsr/hsr_device.c:472:6: note: Assuming field 'use_vlan_for_sv' is 0
           if (hsr->use_vlan_for_sv) {
               ^~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:472:2: note: Taking false branch
           if (hsr->use_vlan_for_sv) {
           ^
   net/hsr/hsr_device.c:482:6: note: Assuming field 'prot_version' is <=3D 0
           if (hsr->prot_version > 0) {
               ^~~~~~~~~~~~~~~~~~~~~
   net/hsr/hsr_device.c:482:2: note: Taking false branch
           if (hsr->prot_version > 0) {
           ^
   net/hsr/hsr_device.c:489:36: note: Field 'prot_version' is 0
           set_hsr_stag_path(hsr_stag, (hsr->prot_version ? 0x0 : 0xf));
                                             ^
   net/hsr/hsr_device.c:489:31: note: '?' condition is false
           set_hsr_stag_path(hsr_stag, (hsr->prot_version ? 0x0 : 0xf));
                                        ^
   net/hsr/hsr_device.c:493:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&master->hsr->seqnr_lock, irqflags);
           ^
   include/linux/spinlock.h:384:2: note: expanded from macro 'spin_lock_irq=
save'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ^
   include/linux/spinlock.h:250:2: note: expanded from macro 'raw_spin_lock=
_irqsave'
           do {                                            \
           ^
   net/hsr/hsr_device.c:493:2: note: Loop condition is false.  Exiting loop
           spin_lock_irqsave(&master->hsr->seqnr_lock, irqflags);
           ^
   include/linux/spinlock.h:382:43: note: expanded from macro 'spin_lock_ir=
qsave'
   #define spin_lock_irqsave(lock, flags)                          \

vim +/hsr +387 net/hsr/hsr_device.c

f421436a591d34 Arvid Brodin     2013-10-30  384  =

28e458e097f32a Murali Karicheri 2020-07-22  385  static struct sk_buff *hsr=
_init_skb(struct hsr_port *master, u16 proto)
f421436a591d34 Arvid Brodin     2013-10-30  386  {
121c33b07b3127 Murali Karicheri 2020-07-22 @387  	struct hsr_priv *hsr =3D =
master->hsr;
f421436a591d34 Arvid Brodin     2013-10-30  388  	struct sk_buff *skb;
f421436a591d34 Arvid Brodin     2013-10-30  389  	int hlen, tlen;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  390  	int len;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  391  =

46bd10a0a3c2a2 Murali Karicheri 2021-07-08  392  	hsr =3D master->hsr;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  393  =

46bd10a0a3c2a2 Murali Karicheri 2021-07-08  394  	if (hsr->disable_sv_frame)
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  395  		return NULL;
f421436a591d34 Arvid Brodin     2013-10-30  396  =

c5a75911721002 Arvid Brodin     2014-07-04  397  	hlen =3D LL_RESERVED_SPAC=
E(master->dev);
c5a75911721002 Arvid Brodin     2014-07-04  398  	tlen =3D master->dev->nee=
ded_tailroom;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  399  	len =3D sizeof(struct hsr=
_tag) +
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  400  	      sizeof(struct hsr_s=
up_tag) +
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  401  	      sizeof(struct hsr_s=
up_payload) + hlen + tlen;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  402  =

46bd10a0a3c2a2 Murali Karicheri 2021-07-08  403  	if (hsr->use_vlan_for_sv)
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  404  		len +=3D VLAN_HLEN;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  405  =

c643ff0383c858 Murali Karicheri 2020-07-22  406  	/* skb size is same for P=
RP/HSR frames, only difference
c643ff0383c858 Murali Karicheri 2020-07-22  407  	 * being, for PRP it is a=
 trailer and for HSR it is a
c643ff0383c858 Murali Karicheri 2020-07-22  408  	 * header
c643ff0383c858 Murali Karicheri 2020-07-22  409  	 */
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  410  	skb =3D dev_alloc_skb(len=
);
05ca6e644dc9b7 Murali Karicheri 2019-04-05  411  	if (!skb)
121c33b07b3127 Murali Karicheri 2020-07-22  412  		return skb;
f421436a591d34 Arvid Brodin     2013-10-30  413  =

f421436a591d34 Arvid Brodin     2013-10-30  414  	skb_reserve(skb, hlen);
c5a75911721002 Arvid Brodin     2014-07-04  415  	skb->dev =3D master->dev;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  416  	if (hsr->use_vlan_for_sv)=
 {
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  417  		proto =3D ETH_P_8021Q;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  418  		skb->priority =3D hsr->s=
v_frame_pcp;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  419  	} else {
f421436a591d34 Arvid Brodin     2013-10-30  420  		skb->priority =3D TC_PRI=
O_CONTROL;
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  421  	}
46bd10a0a3c2a2 Murali Karicheri 2021-07-08  422  	skb->protocol =3D htons(p=
roto);
f421436a591d34 Arvid Brodin     2013-10-30  423  =

28e458e097f32a Murali Karicheri 2020-07-22  424  	if (dev_hard_header(skb, =
skb->dev, proto,
121c33b07b3127 Murali Karicheri 2020-07-22  425  			    hsr->sup_multicast_=
addr,
f266a683a4804d Arvid Brodin     2014-07-04  426  			    skb->dev->dev_addr,=
 skb->len) <=3D 0)
f421436a591d34 Arvid Brodin     2013-10-30  427  		goto out;
121c33b07b3127 Murali Karicheri 2020-07-22  428  =

f266a683a4804d Arvid Brodin     2014-07-04  429  	skb_reset_mac_header(skb);
3ed0a1d563903b Taehee Yoo       2019-12-22  430  	skb_reset_network_header(=
skb);
3ed0a1d563903b Taehee Yoo       2019-12-22  431  	skb_reset_transport_heade=
r(skb);
f421436a591d34 Arvid Brodin     2013-10-30  432  =

121c33b07b3127 Murali Karicheri 2020-07-22  433  	return skb;
121c33b07b3127 Murali Karicheri 2020-07-22  434  out:
121c33b07b3127 Murali Karicheri 2020-07-22  435  	kfree_skb(skb);
121c33b07b3127 Murali Karicheri 2020-07-22  436  =

121c33b07b3127 Murali Karicheri 2020-07-22  437  	return NULL;
121c33b07b3127 Murali Karicheri 2020-07-22  438  }
121c33b07b3127 Murali Karicheri 2020-07-22  439  =


:::::: The code@line 387 was first introduced by commit
:::::: 121c33b07b3127f501b366bc23d2a590e2f2b8ef net: hsr: introduce common =
code for skb initialization

:::::: TO: Murali Karicheri <m-karicheri2@ti.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8083395199342590538==--

