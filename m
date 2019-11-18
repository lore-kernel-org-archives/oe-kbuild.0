Content-Type: multipart/mixed; boundary="===============4464633229699195397=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [feng:master 7/12] mm/page_alloc.c:5644 dump_node_zonelists() error: format specifier '%]' invalid
Date: Mon, 18 Nov 2019 08:54:22 +0300
Message-ID: <20191118055422.GA1776@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4464633229699195397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   feng/master
head:   2c92de2e1f348ec7ea1884503b8b873276f37ed3
commit: 16d2d0ab190b72af553cb361ccdd9a6a7b20cc0d [7/12] zonelist: add dump

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/page_alloc.c:5644 dump_node_zonelists() error: format specifier '%]' inv=
alid

git remote add feng git://bee.sh.intel.com/git/feng/linux.git
git remote update feng
git checkout 16d2d0ab190b72af553cb361ccdd9a6a7b20cc0d
vim +5644 mm/page_alloc.c

523b945855a142 Christoph Lameter 2007-10-16  5620  =

f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5621  /*
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5622   * Build zonelists order=
ed by zone and nodes within zones.
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5623   * This results in conse=
rving DMA zone[s] until all Normal memory is
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5624   * exhausted, but result=
s in overflowing to remote node while memory
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5625   * may still exist in lo=
cal DMA zone.
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5626   */
f0c0b2b808f232 KAMEZAWA Hiroyuki 2007-07-15  5627  =

16d2d0ab190b72 Feng Tang         2019-11-17  5628  static dump_node_zonelis=
ts(pg_data_t *pgdat)
16d2d0ab190b72 Feng Tang         2019-11-17  5629  {
16d2d0ab190b72 Feng Tang         2019-11-17  5630  	struct zonelist *fallba=
ck;
16d2d0ab190b72 Feng Tang         2019-11-17  5631  	struct zoneref *zrefs;
16d2d0ab190b72 Feng Tang         2019-11-17  5632  	int i;
16d2d0ab190b72 Feng Tang         2019-11-17  5633  =

16d2d0ab190b72 Feng Tang         2019-11-17  5634  	fallback =3D pgdat->nod=
e_zonelists;
16d2d0ab190b72 Feng Tang         2019-11-17  5635  	zrefs =3D fallback->_zo=
nerefs;
16d2d0ab190b72 Feng Tang         2019-11-17  5636  =

16d2d0ab190b72 Feng Tang         2019-11-17  5637  	mp("zone_lists for node=
[%d]:", pgdat->node_id);
16d2d0ab190b72 Feng Tang         2019-11-17  5638  =

16d2d0ab190b72 Feng Tang         2019-11-17  5639  	for (i =3D 0; i < MAX_Z=
ONES_PER_ZONELIST + 1; i++) {
16d2d0ab190b72 Feng Tang         2019-11-17  5640  	=

16d2d0ab190b72 Feng Tang         2019-11-17  5641  		printk("[%d]: nid[%].z=
one[%d]\n",
                                                                           =
       ^^
Missing character.

16d2d0ab190b72 Feng Tang         2019-11-17  5642  			i,
16d2d0ab190b72 Feng Tang         2019-11-17  5643  			zrefs->zone->node,
16d2d0ab190b72 Feng Tang         2019-11-17 @5644  			zrefs->zone_idx
16d2d0ab190b72 Feng Tang         2019-11-17  5645  			);
16d2d0ab190b72 Feng Tang         2019-11-17  5646  =

16d2d0ab190b72 Feng Tang         2019-11-17  5647  		zrefs++;
16d2d0ab190b72 Feng Tang         2019-11-17  5648  		if (!zrefs->zone)
16d2d0ab190b72 Feng Tang         2019-11-17  5649  			break;
16d2d0ab190b72 Feng Tang         2019-11-17  5650  	}
16d2d0ab190b72 Feng Tang         2019-11-17  5651  }
16d2d0ab190b72 Feng Tang         2019-11-17  5652  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============4464633229699195397==--

