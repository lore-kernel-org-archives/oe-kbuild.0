Content-Type: multipart/mixed; boundary="===============6848354334840704701=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_main.c:5677 ice_update_vsi_tx_ring_stats() error: we previously assumed 'ring' could be null (see line 5673)
Date: Sun, 27 Feb 2022 03:13:57 +0800
Message-ID: <202202262103.FE80QTSB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6848354334840704701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: e72bba21355dbb67512a0d666fec9f4b56dbfc2f ice: split ice_ring onto T=
x/Rx separate structs
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: ia64-randconfig-m031-20220220 (https://download.01.org/0day-ci/arch=
ive/20220226/202202262103.FE80QTSB-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/intel/ice/ice_main.c:5677 ice_update_vsi_tx_ring_stats=
() error: we previously assumed 'ring' could be null (see line 5673)

vim +/ring +5677 drivers/net/ethernet/intel/ice/ice_main.c

fcea6f3da546b93 Anirudh Venkataramanan 2018-03-20  5654  =

49d358e0e746dc2 Marta Plantykow        2020-05-15  5655  /**
49d358e0e746dc2 Marta Plantykow        2020-05-15  5656   * ice_update_vsi_=
tx_ring_stats - Update VSI Tx ring stats counters
49d358e0e746dc2 Marta Plantykow        2020-05-15  5657   * @vsi: the VSI t=
o be updated
49d358e0e746dc2 Marta Plantykow        2020-05-15  5658   * @rings: rings t=
o work on
49d358e0e746dc2 Marta Plantykow        2020-05-15  5659   * @count: number =
of rings
49d358e0e746dc2 Marta Plantykow        2020-05-15  5660   */
49d358e0e746dc2 Marta Plantykow        2020-05-15  5661  static void
e72bba21355dbb6 Maciej Fijalkowski     2021-08-19  5662  ice_update_vsi_tx_=
ring_stats(struct ice_vsi *vsi, struct ice_tx_ring **rings,
49d358e0e746dc2 Marta Plantykow        2020-05-15  5663  			     u16 count)
49d358e0e746dc2 Marta Plantykow        2020-05-15  5664  {
49d358e0e746dc2 Marta Plantykow        2020-05-15  5665  	struct rtnl_link_=
stats64 *vsi_stats =3D &vsi->net_stats;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5666  	u16 i;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5667  =

49d358e0e746dc2 Marta Plantykow        2020-05-15  5668  	for (i =3D 0; i <=
 count; i++) {
e72bba21355dbb6 Maciej Fijalkowski     2021-08-19  5669  		struct ice_tx_ri=
ng *ring;
e72bba21355dbb6 Maciej Fijalkowski     2021-08-19  5670  		u64 pkts =3D 0, =
bytes =3D 0;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5671  =

49d358e0e746dc2 Marta Plantykow        2020-05-15  5672  		ring =3D READ_ON=
CE(rings[i]);
e72bba21355dbb6 Maciej Fijalkowski     2021-08-19 @5673  		if (ring)
e72bba21355dbb6 Maciej Fijalkowski     2021-08-19  5674  			ice_fetch_u64_s=
tats_per_ring(&ring->syncp, ring->stats, &pkts, &bytes);
49d358e0e746dc2 Marta Plantykow        2020-05-15  5675  		vsi_stats->tx_pa=
ckets +=3D pkts;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5676  		vsi_stats->tx_by=
tes +=3D bytes;
49d358e0e746dc2 Marta Plantykow        2020-05-15 @5677  		vsi->tx_restart =
+=3D ring->tx_stats.restart_q;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5678  		vsi->tx_busy +=
=3D ring->tx_stats.tx_busy;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5679  		vsi->tx_lineariz=
e +=3D ring->tx_stats.tx_linearize;
49d358e0e746dc2 Marta Plantykow        2020-05-15  5680  	}
49d358e0e746dc2 Marta Plantykow        2020-05-15  5681  }
49d358e0e746dc2 Marta Plantykow        2020-05-15  5682  =


:::::: The code at line 5677 was first introduced by commit
:::::: 49d358e0e746dc24bfb1b1cf98c17064e5177424 ice: Add XDP Tx to VSI ring=
 stats

:::::: TO: Marta Plantykow <marta.a.plantykow@intel.com>
:::::: CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6848354334840704701==--

