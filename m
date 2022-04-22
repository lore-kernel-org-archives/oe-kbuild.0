Content-Type: multipart/mixed; boundary="===============7047581877926258263=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bridge/br_switchdev.c:18:14: warning: Uninitialized variable: p->hwdom [uninitvar]
Date: Fri, 22 Apr 2022 16:56:29 +0800
Message-ID: <202204221618.Y01lGjPN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7047581877926258263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Tobias Waldekranz <tobias@waldekranz.com>
CC: Vladimir Oltean <vladimir.oltean@nxp.com>
CC: Grygorii Strashko <grygorii.strashko@ti.com>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d569e86915b7f2f9795588591c8d5ea0b66481cb
commit: f7cf972f9375388838b0fbdaa007ce8494646990 net: bridge: disambiguate =
offload_fwd_mark
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f7cf972f9375388838b0fbdaa007ce8494646990
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/bridge/br_switchdev.c:18:14: warning: Uninitialized variable: p->hwd=
om [uninitvar]
      return p->hwdom;
                ^

vim +18 net/bridge/br_switchdev.c

6bc506b4fb065e Ido Schimmel      2016-08-25  10  =

f7cf972f937538 Tobias Waldekranz 2021-07-21  11  static int br_switchdev_hw=
dom_get(struct net_bridge *br, struct net_device *dev)
6bc506b4fb065e Ido Schimmel      2016-08-25  12  {
6bc506b4fb065e Ido Schimmel      2016-08-25  13  	struct net_bridge_port *p;
6bc506b4fb065e Ido Schimmel      2016-08-25  14  =

6bc506b4fb065e Ido Schimmel      2016-08-25  15  	/* dev is yet to be added=
 to the port list. */
6bc506b4fb065e Ido Schimmel      2016-08-25  16  	list_for_each_entry(p, &b=
r->port_list, list) {
bccb30254a4a02 Florian Fainelli  2019-02-06  17  		if (netdev_port_same_par=
ent_id(dev, p->dev))
f7cf972f937538 Tobias Waldekranz 2021-07-21 @18  			return p->hwdom;
6bc506b4fb065e Ido Schimmel      2016-08-25  19  	}
6bc506b4fb065e Ido Schimmel      2016-08-25  20  =

f7cf972f937538 Tobias Waldekranz 2021-07-21  21  	return ++br->last_hwdom;
6bc506b4fb065e Ido Schimmel      2016-08-25  22  }
6bc506b4fb065e Ido Schimmel      2016-08-25  23  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7047581877926258263==--

