Content-Type: multipart/mixed; boundary="===============6311836229988108826=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [congwang:sch_bpf 2/4] net/core/skb_map.c:175 skb_map_get_next_key() error: we previously assumed 'key' could be null (see line 170)
Date: Sun, 22 May 2022 13:23:10 +0800
Message-ID: <202205221325.tXVMMrOx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6311836229988108826==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cong Wang <xiyou.wangcong@gmail.com>

tree:   https://github.com/congwang/linux.git sch_bpf
head:   6ffa225aaaaa22848f4629fc911a682553f17770
commit: 87784a11f90e7582ee664b531af17f7ca6ce2b62 [2/4] bpf: introduce skb m=
ap
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
522/202205221325.tXVMMrOx-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/core/skb_map.c:175 skb_map_get_next_key() error: we previously assumed =
'key' could be null (see line 170)

vim +/key +175 net/core/skb_map.c

87784a11f90e75 Cong Wang 2020-11-08  162  =

87784a11f90e75 Cong Wang 2020-11-08  163  /* Called from syscall */
87784a11f90e75 Cong Wang 2020-11-08  164  static int skb_map_get_next_key(s=
truct bpf_map *map, void *key, void *next_key)
87784a11f90e75 Cong Wang 2020-11-08  165  {
87784a11f90e75 Cong Wang 2020-11-08  166  	struct bpf_skb_map *rb =3D bpf_s=
kb_map(map);
87784a11f90e75 Cong Wang 2020-11-08  167  	struct sk_buff *skb;
87784a11f90e75 Cong Wang 2020-11-08  168  	u64 rank;
87784a11f90e75 Cong Wang 2020-11-08  169  =

87784a11f90e75 Cong Wang 2020-11-08 @170  	if (!key) {
87784a11f90e75 Cong Wang 2020-11-08  171  		skb =3D skb_rb_first(&rb->root);
87784a11f90e75 Cong Wang 2020-11-08  172  		if (!skb)
87784a11f90e75 Cong Wang 2020-11-08  173  			return -ENOENT;
87784a11f90e75 Cong Wang 2020-11-08  174  	}
87784a11f90e75 Cong Wang 2020-11-08 @175  	rank =3D *(u64 *) key;
87784a11f90e75 Cong Wang 2020-11-08  176  	skb =3D skb_rb_find(&rb->root, r=
ank);
87784a11f90e75 Cong Wang 2020-11-08  177  	if (!skb)
87784a11f90e75 Cong Wang 2020-11-08  178  		return -ENOENT;
87784a11f90e75 Cong Wang 2020-11-08  179  	skb =3D skb_rb_next(skb);
87784a11f90e75 Cong Wang 2020-11-08  180  	if (!skb)
87784a11f90e75 Cong Wang 2020-11-08  181  		return 0;
87784a11f90e75 Cong Wang 2020-11-08  182  	*(u64 *) next_key =3D skb_map_cb=
(skb)->rank;
87784a11f90e75 Cong Wang 2020-11-08  183  	return 0;
87784a11f90e75 Cong Wang 2020-11-08  184  }
87784a11f90e75 Cong Wang 2020-11-08  185  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6311836229988108826==--

