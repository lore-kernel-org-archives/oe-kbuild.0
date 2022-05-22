Content-Type: multipart/mixed; boundary="===============8029469317183419615=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v5 10/11] igc: Check incompatible configs for Frame Preemption
Date: Sun, 22 May 2022 18:18:17 +0800
Message-ID: <202205221852.CJ4p5boS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8029469317183419615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220520011538.1098888-11-vinicius.gomes@intel.com>
References: <20220520011538.1098888-11-vinicius.gomes@intel.com>
TO: Vinicius Costa Gomes <vinicius.gomes@intel.com>
TO: netdev(a)vger.kernel.org
CC: Vinicius Costa Gomes <vinicius.gomes@intel.com>
CC: jhs(a)mojatatu.com
CC: xiyou.wangcong(a)gmail.com
CC: jiri(a)resnulli.us
CC: davem(a)davemloft.net
CC: vladimir.oltean(a)nxp.com
CC: po.liu(a)nxp.com
CC: boon.leong.ong(a)intel.com
CC: intel-wired-lan(a)lists.osuosl.org

Hi Vinicius,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Vinicius-Costa-Gomes=
/ethtool-Add-support-for-frame-preemption/20220520-092800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
df98714e432abf5cbdac3e4c1a13f94c65ddb8d3
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220522 (https://download.01.org/0day-ci/archi=
ve/20220522/202205221852.CJ4p5boS-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443db=
aba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/a42e940bc53c40ee4e3=
3a1bbf022a663bb28a9c7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vinicius-Costa-Gomes/ethtool-Add-s=
upport-for-frame-preemption/20220520-092800
        git checkout a42e940bc53c40ee4e33a1bbf022a663bb28a9c7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:937:21: note: Value stored to =
'dev' during its initialization is never read
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:962:2: warning: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11 [clan=
g-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(hw->mac.addr, addr->sa_data, netdev->addr_len);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:962:2: note: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(hw->mac.addr, addr->sa_data, netdev->addr_len);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1000:3: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(mta_list + (i++ * ETH_ALEN), ha->addr, ETH_ALEN);
                   ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1000:3: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(mta_list + (i++ * ETH_ALEN), ha->addr, ETH_ALEN);
                   ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1784:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(__skb_put(skb, headlen + metasize), xdp->data_meta,
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:1784:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(__skb_put(skb, headlen + metasize), xdp->data_meta,
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:2595:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(__skb_put(skb, totalsize), xdp->data_meta,
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:2595:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(__skb_put(skb, totalsize), xdp->data_meta,
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3035:21: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3035:21: note: Value stored to=
 'dev' during its initialization is never read
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3064:21: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3064:21: note: Value stored to=
 'dev' during its initialization is never read
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3100:21: warning: Value stored=
 to 'dev' during its initialization is never read [clang-analyzer-deadcode.=
DeadStores]
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3100:21: note: Value stored to=
 'dev' during its initialization is never read
           struct net_device *dev =3D adapter->netdev;
                              ^~~   ~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3374:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&flex->data[offset], src, len);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:3374:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&flex->data[offset], src, len);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:4154:3: warning: Value stored =
to 'current_itr' is never read [clang-analyzer-deadcode.DeadStores]
                   current_itr =3D 0;
                   ^             ~
   drivers/net/ethernet/intel/igc/igc_main.c:4154:3: note: Value stored to =
'current_itr' is never read
                   current_itr =3D 0;
                   ^             ~
   drivers/net/ethernet/intel/igc/igc_main.c:4311:6: warning: Value stored =
to 'new_val' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           int new_val =3D q_vector->itr_val;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:4311:6: note: Value stored to =
'new_val' during its initialization is never read
           int new_val =3D q_vector->itr_val;
               ^~~~~~~   ~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:4493:3: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(q_vector, 0, struct_size(q_vector, ring, ring_cou=
nt));
                   ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:4493:3: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
                   memset(q_vector, 0, struct_size(q_vector, ring, ring_cou=
nt));
                   ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5071:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(stats, &adapter->stats64, sizeof(*stats));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5071:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(stats, &adapter->stats64, sizeof(*stats));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5316:4: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           sprintf(q_vector->name, "%s-TxRx-%u", netdev->na=
me,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5316:4: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           sprintf(q_vector->name, "%s-TxRx-%u", netdev->na=
me,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5319:4: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           sprintf(q_vector->name, "%s-tx-%u", netdev->name,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5319:4: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           sprintf(q_vector->name, "%s-tx-%u", netdev->name,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5322:4: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           sprintf(q_vector->name, "%s-rx-%u", netdev->name,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5322:4: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           sprintf(q_vector->name, "%s-rx-%u", netdev->name,
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5325:4: warning: Call to funct=
ion 'sprintf' is insecure as it does not provide bounding of the memory buf=
fer or security checks introduced in the C11 standard. Replace with analogo=
us functions that support length arguments or provides boundary checks such=
 as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.Depreca=
tedOrUnsafeBufferHandling]
                           sprintf(q_vector->name, "%s-unused", netdev->nam=
e);
                           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5325:4: note: Call to function=
 'sprintf' is insecure as it does not provide bounding of the memory buffer=
 or security checks introduced in the C11 standard. Replace with analogous =
functions that support length arguments or provides boundary checks such as=
 'sprintf_s' in case of C11
                           sprintf(q_vector->name, "%s-unused", netdev->nam=
e);
                           ^~~~~~~
>> drivers/net/ethernet/intel/igc/igc_main.c:5919:6: warning: Access to fie=
ld 'preemptible' results in a dereference of an undefined pointer value (lo=
aded from variable 'ring') [clang-analyzer-core.NullDereference]
           if (ring->preemptible) {
               ^
   drivers/net/ethernet/intel/igc/igc_main.c:6258:2: note: Control jumps to=
 'case TC_SETUP_QDISC_ETF:'  at line 6262
           switch (type) {
           ^
   drivers/net/ethernet/intel/igc/igc_main.c:6263:10: note: Calling 'igc_ts=
n_enable_launchtime'
                   return igc_tsn_enable_launchtime(adapter, type_data);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5989:6: note: Assuming field '=
type' is equal to igc_i225
           if (hw->mac.type !=3D igc_i225)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5989:2: note: Taking false bra=
nch
           if (hw->mac.type !=3D igc_i225)
           ^
   drivers/net/ethernet/intel/igc/igc_main.c:5992:8: note: Calling 'igc_sav=
e_launchtime_params'
           err =3D igc_save_launchtime_params(adapter, qopt->queue, qopt->e=
nable);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5914:2: note: 'ring' declared =
without an initial value
           struct igc_ring *ring;
           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5916:6: note: Assuming 'queue'=
 is >=3D 0
           if (queue < 0 || queue >=3D adapter->num_tx_queues)
               ^~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5916:6: note: Left side of '||=
' is false
   drivers/net/ethernet/intel/igc/igc_main.c:5916:19: note: Assuming 'queue=
' is < field 'num_tx_queues'
           if (queue < 0 || queue >=3D adapter->num_tx_queues)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:5916:2: note: Taking false bra=
nch
           if (queue < 0 || queue >=3D adapter->num_tx_queues)
           ^
   drivers/net/ethernet/intel/igc/igc_main.c:5919:6: note: Access to field =
'preemptible' results in a dereference of an undefined pointer value (loade=
d from variable 'ring')
           if (ring->preemptible) {
               ^~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6169:2: warning: Call to funct=
ion 'memset' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memset_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(data, 0, IGC_FP_SMD_FRAME_SIZE);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6169:2: note: Call to function=
 'memset' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memset_s' in case of C11
           memset(data, 0, IGC_FP_SMD_FRAME_SIZE);
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6533:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hw->mac.ops, ei->mac_ops, sizeof(hw->mac.ops));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6533:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&hw->mac.ops, ei->mac_ops, sizeof(hw->mac.ops));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6534:2: warning: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11 [cla=
ng-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&hw->phy.ops, ei->phy_ops, sizeof(hw->phy.ops));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6534:2: note: Call to function=
 'memcpy' is insecure as it does not provide security checks introduced in =
the C11 standard. Replace with analogous functions that support length argu=
ments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&hw->phy.ops, ei->phy_ops, sizeof(hw->phy.ops));
           ^~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6651:2: warning: Call to funct=
ion 'strncpy' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'strncpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(netdev->name, "eth%d", IFNAMSIZ);
           ^~~~~~~
   drivers/net/ethernet/intel/igc/igc_main.c:6651:2: note: Call to function=
 'strncpy' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'strncpy_s' in case of C11
           strncpy(netdev->name, "eth%d", IFNAMSIZ);
           ^~~~~~~
   Suppressed 93 warnings (91 in non-user code, 2 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   68 warnings generated.
   drivers/net/ethernet/brocade/bna/bna_enet.c:201:3: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(stats_dst, 0, sizeof(struct bfi_enet_stats_rxf));
                   ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:201:3: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
                   memset(stats_dst, 0, sizeof(struct bfi_enet_stats_rxf));
                   ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:216:3: warning: Call to func=
tion 'memset' is insecure as it does not provide security checks introduced=
 in the C11 standard. Replace with analogous functions that support length =
arguments or provides boundary checks such as 'memset_s' in case of C11 [cl=
ang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(stats_dst, 0, sizeof(struct bfi_enet_stats_txf));
                   ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:216:3: note: Call to functio=
n 'memset' is insecure as it does not provide security checks introduced in=
 the C11 standard. Replace with analogous functions that support length arg=
uments or provides boundary checks such as 'memset_s' in case of C11
                   memset(stats_dst, 0, sizeof(struct bfi_enet_stats_txf));
                   ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:1732:2: warning: Value store=
d to 'kva' is never read [clang-analyzer-deadcode.DeadStores]
           kva +=3D bfa_msgq_meminfo();
           ^      ~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:1732:2: note: Value stored t=
o 'kva' is never read
           kva +=3D bfa_msgq_meminfo();
           ^      ~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:1733:2: warning: Value store=
d to 'dma' is never read [clang-analyzer-deadcode.DeadStores]
           dma +=3D bfa_msgq_meminfo();
           ^      ~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/brocade/bna/bna_enet.c:1733:2: note: Value stored t=
o 'dma' is never read
           dma +=3D bfa_msgq_meminfo();
           ^      ~~~~~~~~~~~~~~~~~~
   Suppressed 64 warnings (64 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   72 warnings generated.
   drivers/net/ethernet/brocade/bna/bna_tx_rx.c:305:2: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&req->table[0], rxf->rit, rxf->rit_size);
           ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_tx_rx.c:305:2: note: Call to functi=
on 'memcpy' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(&req->table[0], rxf->rit, rxf->rit_size);
           ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_tx_rx.c:640:2: warning: Call to fun=
ction 'memset' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memset_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rxf->vlan_filter_table, 0,
           ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_tx_rx.c:640:2: note: Call to functi=
on 'memset' is insecure as it does not provide security checks introduced i=
n the C11 standard. Replace with analogous functions that support length ar=
guments or provides boundary checks such as 'memset_s' in case of C11
           memset(rxf->vlan_filter_table, 0,
           ^~~~~~
   drivers/net/ethernet/brocade/bna/bna_tx_rx.c:912:3: warning: Call to fun=
ction 'memcpy' is insecure as it does not provide security checks introduce=
d in the C11 standard. Replace with analogous functions that support length=
 arguments or provides boundary checks such as 'memcpy_s' in case of C11 [c=
lang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]

vim +5919 drivers/net/ethernet/intel/igc/igc_main.c

5f2958052c5820 Vinicius Costa Gomes 2019-12-02  5910  =

82faa9b799500f Vinicius Costa Gomes 2020-02-14  5911  static int igc_save_l=
aunchtime_params(struct igc_adapter *adapter, int queue,
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5912  				      bool enable)
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5913  {
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5914  	struct igc_ring *rin=
g;
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5915  =

82faa9b799500f Vinicius Costa Gomes 2020-02-14  5916  	if (queue < 0 || que=
ue >=3D adapter->num_tx_queues)
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5917  		return -EINVAL;
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5918  =

a42e940bc53c40 Vinicius Costa Gomes 2022-05-19 @5919  	if (ring->preemptibl=
e) {
a42e940bc53c40 Vinicius Costa Gomes 2022-05-19  5920  		netdev_err(adapter-=
>netdev, "Cannot enable LaunchTime on a preemptible queue\n");
a42e940bc53c40 Vinicius Costa Gomes 2022-05-19  5921  		return -EINVAL;
a42e940bc53c40 Vinicius Costa Gomes 2022-05-19  5922  	}
a42e940bc53c40 Vinicius Costa Gomes 2022-05-19  5923  =

82faa9b799500f Vinicius Costa Gomes 2020-02-14  5924  	ring =3D adapter->tx=
_ring[queue];
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5925  	ring->launchtime_ena=
ble =3D enable;
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5926  =

82faa9b799500f Vinicius Costa Gomes 2020-02-14  5927  	return 0;
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5928  }
82faa9b799500f Vinicius Costa Gomes 2020-02-14  5929  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8029469317183419615==--

