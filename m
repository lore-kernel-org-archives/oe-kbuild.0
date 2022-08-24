Content-Type: multipart/mixed; boundary="===============2905536626395451217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/dsa/tag_sja1105.c:168 sja1105_xmit_tpid() error: uninitialized symbol 'proto'.
Date: Wed, 24 Aug 2022 19:47:29 +0800
Message-ID: <202208241912.7oIGqBq6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2905536626395451217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 8ded9160928e545c2e694b77a87263fa078ff4c6 net: dsa: tag_sja1105: sto=
p asking the sja1105 driver in sja1105_xmit_tpid
date:   12 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 12 months ago
config: openrisc-randconfig-m031-20220824 (https://download.01.org/0day-ci/=
archive/20220824/202208241912.7oIGqBq6-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/dsa/tag_sja1105.c:168 sja1105_xmit_tpid() error: uninitialized symbol '=
proto'.

Old smatch warnings:
net/dsa/tag_sja1105.c:508 sja1105_rcv() error: uninitialized symbol 'vid'.

vim +/proto +168 net/dsa/tag_sja1105.c

a68578c20a9667 Vladimir Oltean 2020-01-04  135  =

8ded9160928e54 Vladimir Oltean 2021-08-24  136  /* Send VLAN tags with a TP=
ID that blends in with whatever VLAN protocol a
8ded9160928e54 Vladimir Oltean 2021-08-24  137   * bridge spanning ports of=
 this switch might have.
8ded9160928e54 Vladimir Oltean 2021-08-24  138   */
994d2cbb08ca05 Vladimir Oltean 2021-08-17  139  static u16 sja1105_xmit_tpi=
d(struct dsa_port *dp)
38b5beeae7a4cd Vladimir Oltean 2020-05-12  140  {
8ded9160928e54 Vladimir Oltean 2021-08-24  141  	struct dsa_switch *ds =3D =
dp->ds;
8ded9160928e54 Vladimir Oltean 2021-08-24  142  	struct dsa_port *other_dp;
8ded9160928e54 Vladimir Oltean 2021-08-24  143  	u16 proto;
8ded9160928e54 Vladimir Oltean 2021-08-24  144  =

8ded9160928e54 Vladimir Oltean 2021-08-24  145  	/* Since VLAN awareness is=
 global, then if this port is VLAN-unaware,
8ded9160928e54 Vladimir Oltean 2021-08-24  146  	 * all ports are. Use the =
VLAN-unaware TPID used for tag_8021q.
8ded9160928e54 Vladimir Oltean 2021-08-24  147  	 */
8ded9160928e54 Vladimir Oltean 2021-08-24  148  	if (!dsa_port_is_vlan_filt=
ering(dp))
8ded9160928e54 Vladimir Oltean 2021-08-24  149  		return ETH_P_SJA1105;
8ded9160928e54 Vladimir Oltean 2021-08-24  150  =

8ded9160928e54 Vladimir Oltean 2021-08-24  151  	/* Port is VLAN-aware, so =
there is a bridge somewhere (a single one,
8ded9160928e54 Vladimir Oltean 2021-08-24  152  	 * we're sure about that).=
 It may not be on this port though, so we
8ded9160928e54 Vladimir Oltean 2021-08-24  153  	 * need to find it.
8ded9160928e54 Vladimir Oltean 2021-08-24  154  	 */
8ded9160928e54 Vladimir Oltean 2021-08-24  155  	list_for_each_entry(other_=
dp, &ds->dst->ports, list) {
8ded9160928e54 Vladimir Oltean 2021-08-24  156  		if (other_dp->ds !=3D ds)
8ded9160928e54 Vladimir Oltean 2021-08-24  157  			continue;
8ded9160928e54 Vladimir Oltean 2021-08-24  158  =

8ded9160928e54 Vladimir Oltean 2021-08-24  159  		if (!other_dp->bridge_dev)
8ded9160928e54 Vladimir Oltean 2021-08-24  160  			continue;
8ded9160928e54 Vladimir Oltean 2021-08-24  161  =

8ded9160928e54 Vladimir Oltean 2021-08-24  162  		/* Error is returned only=
 if CONFIG_BRIDGE_VLAN_FILTERING,
8ded9160928e54 Vladimir Oltean 2021-08-24  163  		 * which seems pointless =
to handle, as our port cannot become
8ded9160928e54 Vladimir Oltean 2021-08-24  164  		 * VLAN-aware in that cas=
e.
8ded9160928e54 Vladimir Oltean 2021-08-24  165  		 */
8ded9160928e54 Vladimir Oltean 2021-08-24  166  		br_vlan_get_proto(other_d=
p->bridge_dev, &proto);
8ded9160928e54 Vladimir Oltean 2021-08-24  167  =

8ded9160928e54 Vladimir Oltean 2021-08-24 @168  		return proto;
8ded9160928e54 Vladimir Oltean 2021-08-24  169  	}
994d2cbb08ca05 Vladimir Oltean 2021-08-17  170  =

8ded9160928e54 Vladimir Oltean 2021-08-24  171  	WARN_ONCE(1, "Port is VLAN=
-aware but cannot find associated bridge!\n");
994d2cbb08ca05 Vladimir Oltean 2021-08-17  172  =

8ded9160928e54 Vladimir Oltean 2021-08-24  173  	return ETH_P_SJA1105;
38b5beeae7a4cd Vladimir Oltean 2020-05-12  174  }
38b5beeae7a4cd Vladimir Oltean 2020-05-12  175  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2905536626395451217==--

