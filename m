Content-Type: multipart/mixed; boundary="===============7545927703324378781=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hying-caritas:mmotm-2021-12-06 130/268] mm/migrate.c:3041 __disable_all_migrate_targets() warn: we never enter this loop
Date: Sun, 12 Dec 2021 12:44:16 +0800
Message-ID: <202112121257.Yu9xinF1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7545927703324378781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Baolin Wang <baolin.wang@linux.alibaba.com>
CC: Huang Ying <ying.huang@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/hying-caritas/linux.git mmotm-2021-12-06
head:   a57b74d47d00793cb27918be5147ede2ece3a37b
commit: ba7efa487a79bf9a2524936c6d9e0482e3b597e9 [130/268] mm: migrate: sup=
port multiple target nodes demotion
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121257.Yu9xinF1-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/migrate.c:3041 __disable_all_migrate_targets() warn: we never enter this=
 loop

vim +3041 mm/migrate.c

79c28a41672278 Dave Hansen 2021-09-02  3029  =

76af6a054da405 Dave Hansen 2021-10-18  3030  #if defined(CONFIG_HOTPLUG_CPU)
79c28a41672278 Dave Hansen 2021-09-02  3031  /* Disable reclaim-based migra=
tion. */
79c28a41672278 Dave Hansen 2021-09-02  3032  static void __disable_all_migr=
ate_targets(void)
79c28a41672278 Dave Hansen 2021-09-02  3033  {
ba7efa487a79bf Baolin Wang 2021-12-09  3034  	int node, i;
79c28a41672278 Dave Hansen 2021-09-02  3035  =

ba7efa487a79bf Baolin Wang 2021-12-09  3036  	if (!node_demotion)
ba7efa487a79bf Baolin Wang 2021-12-09  3037  		return;
ba7efa487a79bf Baolin Wang 2021-12-09  3038  =

ba7efa487a79bf Baolin Wang 2021-12-09  3039  	for_each_online_node(node) {
ba7efa487a79bf Baolin Wang 2021-12-09  3040  		node_demotion[node].nr =3D 0;
ba7efa487a79bf Baolin Wang 2021-12-09 @3041  		for (i =3D 0; i < DEMOTION_T=
ARGET_NODES; i++)
ba7efa487a79bf Baolin Wang 2021-12-09  3042  			node_demotion[node].nodes[i=
] =3D NUMA_NO_NODE;
ba7efa487a79bf Baolin Wang 2021-12-09  3043  	}
79c28a41672278 Dave Hansen 2021-09-02  3044  }
79c28a41672278 Dave Hansen 2021-09-02  3045  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7545927703324378781==--

