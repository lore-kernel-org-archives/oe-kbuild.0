Content-Type: multipart/mixed; boundary="===============1804212433091242250=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_lib.c:443:2: warning: There is an unknown macro here somewhere. Configuration is required. If hash_for_each_rcu is a macro then please configure it. [unknownMacro]
Date: Mon, 04 Apr 2022 13:03:55 +0800
Message-ID: <202204041227.Q6VBxeun-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1804212433091242250==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jacob Keller <jacob.e.keller@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 3d5985a185e6abfc0b38ed187819016a79eca864 ice: convert VF storage to=
 hash table with krefs and RCU
date:   4 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
compiler: sparc-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/pci/pci-sysfs.c:1277:47: warning: Parameter 'buf' can be declare=
d with const [constParameter]
           struct bin_attribute *bin_attr, char *buf,
                                                 ^
>> drivers/net/vrf.c:1726:2: warning: There is an unknown macro here somewh=
ere. Configuration is required. If netdev_for_each_lower_dev is a macro the=
n please configure it. [unknownMacro]
    netdev_for_each_lower_dev(dev, port_dev, iter)
    ^
--
>> drivers/net/virtio_net.c:2017:2: warning: There is an unknown macro here=
 somewhere. Configuration is required. If netdev_for_each_uc_addr is a macr=
o then please configure it. [unknownMacro]
    netdev_for_each_uc_addr(ha, dev)
    ^
--
>> drivers/net/ethernet/intel/ice/ice_lib.c:443:2: warning: There is an unk=
nown macro here somewhere. Configuration is required. If hash_for_each_rcu =
is a macro then please configure it. [unknownMacro]
    ice_for_each_vf_rcu(pf, bkt, vf)
    ^
--
>> drivers/net/ethernet/intel/ice/ice_main.c:525:2: warning: There is an un=
known macro here somewhere. Configuration is required. If hash_for_each is =
a macro then please configure it. [unknownMacro]
    ice_for_each_vf(pf, bkt, vf)
    ^

vim +443 drivers/net/ethernet/intel/ice/ice_lib.c

5153a18e57ff3f Anirudh Venkataramanan 2018-09-19  431  =

f66756e0ead7a1 Grzegorz Nitka         2021-08-19  432  static irqreturn_t i=
ce_eswitch_msix_clean_rings(int __always_unused irq, void *data)
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  433  {
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  434  	struct ice_q_vector=
 *q_vector =3D (struct ice_q_vector *)data;
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  435  	struct ice_pf *pf =
=3D q_vector->vsi->back;
c4c2c7db64e19f Jacob Keller           2022-02-16  436  	struct ice_vf *vf;
c4c2c7db64e19f Jacob Keller           2022-02-16  437  	unsigned int bkt;
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  438  =

e72bba21355dbb Maciej Fijalkowski     2021-08-19  439  	if (!q_vector->tx.t=
x_ring && !q_vector->rx.rx_ring)
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  440  		return IRQ_HANDLED;
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  441  =

3d5985a185e6ab Jacob Keller           2022-02-16  442  	rcu_read_lock();
3d5985a185e6ab Jacob Keller           2022-02-16 @443  	ice_for_each_vf_rcu=
(pf, bkt, vf)
c4c2c7db64e19f Jacob Keller           2022-02-16  444  		napi_schedule(&vf-=
>repr->q_vector->napi);
3d5985a185e6ab Jacob Keller           2022-02-16  445  	rcu_read_unlock();
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  446  =

f66756e0ead7a1 Grzegorz Nitka         2021-08-19  447  	return IRQ_HANDLED;
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  448  }
f66756e0ead7a1 Grzegorz Nitka         2021-08-19  449  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1804212433091242250==--

