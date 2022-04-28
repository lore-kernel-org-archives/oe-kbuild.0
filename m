Content-Type: multipart/mixed; boundary="===============2218361603720701954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ti:ti-android-linux-5.10.y 2040/9999] net/hsr/hsr_device.c:387:19: warning: Value stored to 'hsr' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 29 Apr 2022 06:54:03 +0800
Message-ID: <202204290620.uAaUjjdo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2218361603720701954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: vigneshr(a)ti.com
CC: nm(a)ti.com
TO: Murali Karicheri <m-karicheri2@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>
CC: Kishon Vijay Abraham I <kishon@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-android-lin=
ux-5.10.y
head:   6b231b04f2f17dfc0729efb6db9b5203a7786b12
commit: 46bd10a0a3c2a29437907681cafda860a72e86cf [2040/9999] net: hsr: Supp=
ort VLAN tagged supervision frames
:::::: branch date: 10 weeks ago
:::::: commit date: 10 months ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
429/202204290620.uAaUjjdo-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473=
aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-android-linux-5.10.y
        git checkout 46bd10a0a3c2a29437907681cafda860a72e86cf
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   net/llc/llc_conn.c:488:2: note: Loop condition is false.  Exiting loop
           sk_nulls_for_each_rcu(rc, node, laddr_hb) {
           ^
   include/net/sock.h:798:2: note: expanded from macro 'sk_nulls_for_each_r=
cu'
           hlist_nulls_for_each_entry_rcu(__sk, node, list, sk_nulls_node)
           ^
   include/linux/rculist_nulls.h:171:13: note: expanded from macro 'hlist_n=
ulls_for_each_entry_rcu'
                   ({ tpos =3D hlist_nulls_entry(pos, typeof(*tpos), member=
); 1; }); \
                             ^
   include/linux/list_nulls.h:32:46: note: expanded from macro 'hlist_nulls=
_entry'
   #define hlist_nulls_entry(ptr, type, member) container_of(ptr,type,membe=
r)
                                                ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:315:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:303:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:293:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   net/llc/llc_conn.c:488:2: note: Loop condition is true.  Entering loop b=
ody
           sk_nulls_for_each_rcu(rc, node, laddr_hb) {
           ^
   include/net/sock.h:798:2: note: expanded from macro 'sk_nulls_for_each_r=
cu'
           hlist_nulls_for_each_entry_rcu(__sk, node, list, sk_nulls_node)
           ^
   include/linux/rculist_nulls.h:168:2: note: expanded from macro 'hlist_nu=
lls_for_each_entry_rcu'
           for (({barrier();}),                                            =
        \
           ^
   net/llc/llc_conn.c:489:7: note: Calling 'llc_estab_match'
                   if (llc_estab_match(sap, daddr, laddr, rc)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Assuming 'llc->laddr.lsap' is equal to '=
laddr->lsap'
           return llc->laddr.lsap =3D=3D laddr->lsap &&
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
   net/llc/llc_conn.c:461:3: note: Assuming 'llc->daddr.lsap' is equal to '=
daddr->lsap'
                   llc->daddr.lsap =3D=3D daddr->lsap &&
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
           return llc->laddr.lsap =3D=3D laddr->lsap &&
                  ^
   net/llc/llc_conn.c:460:9: note: Left side of '&&' is true
   net/llc/llc_conn.c:463:3: note: Calling 'ether_addr_equal'
                   ether_addr_equal(llc->daddr.mac, daddr->mac);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:329:36: note: The right operand of '^' is a =
garbage value
           u32 fold =3D ((*(const u32 *)addr1) ^ (*(const u32 *)addr2)) |
                                             ^  ~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:95:25: warning: The left operand of '<<' is a garb=
age value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                                  ^
   net/llc/llc_conn.c:776:2: note: Calling 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:266:6: note: Assuming the condition is false
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc_pdu.h:266:2: note: Taking false branch
           if (skb->protocol =3D=3D htons(ETH_P_802_2))
           ^
   net/llc/llc_conn.c:776:2: note: Returning from 'llc_pdu_decode_da'
           llc_pdu_decode_da(skb, daddr.mac);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:779:7: note: Calling '__llc_lookup'
           sk =3D __llc_lookup(sap, &saddr, &daddr);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:599:20: note: Calling '__llc_lookup_established'
           struct sock *sk =3D __llc_lookup_established(sap, daddr, laddr);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/llc/llc_conn.c:483:13: note: Calling 'llc_sk_laddr_hashfn'
           int slot =3D llc_sk_laddr_hashfn(sap, laddr);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/llc.h:81:17: note: Calling 'jhash'
           return hash_32(jhash(laddr->mac, sizeof(laddr->mac), 0),
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jhash.h:79:2: note: Loop condition is false. Execution con=
tinues on line 88
           while (length > 12) {
           ^
   include/linux/jhash.h:88:2: note: Control jumps to 'case 6:'  at line 95
           switch (length) {
           ^
   include/linux/jhash.h:95:25: note: The left operand of '<<' is a garbage=
 value
           case 6:  b +=3D (u32)k[5]<<8;     fallthrough;
                              ~~~~^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
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

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2218361603720701954==--

