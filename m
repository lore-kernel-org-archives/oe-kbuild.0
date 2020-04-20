Content-Type: multipart/mixed; boundary="===============8976752739297141789=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [kdave-btrfs-devel:misc-next 32/57] fs/btrfs/backref.c:2996:19: warning: Local variable 'rb_node' shadows outer variable [shadowVariable]
Date: Mon, 20 Apr 2020 14:58:19 +0800
Message-ID: <202004201416.5o21YRSh%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8976752739297141789==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   8d833610d346fa2e4fa3b82a4641361ffd293533
commit: 7da90930f2e2f7113cbe17431a63a1a71a7e9325 [32/57] btrfs: backref: re=
name and move finish_upper_links()
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   fs/btrfs/backref.c:1630:7: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
     ret =3D 0;
         ^
   fs/btrfs/backref.c:1624:7: note: ret is assigned
     ret =3D -ENOENT;
         ^
   fs/btrfs/backref.c:1630:7: note: ret is overwritten
     ret =3D 0;
         ^
>> fs/btrfs/backref.c:2996:19: warning: Local variable 'rb_node' shadows ou=
ter variable [shadowVariable]
     struct rb_node *rb_node;
                     ^
   fs/btrfs/backref.c:2970:18: note: Shadowed declaration
    struct rb_node *rb_node;
                    ^
   fs/btrfs/backref.c:2996:19: note: Shadow variable
     struct rb_node *rb_node;
                     ^

# https://github.com/kdave/btrfs-devel/commit/7da90930f2e2f7113cbe17431a63a=
1a71a7e9325
git remote add kdave-btrfs-devel https://github.com/kdave/btrfs-devel.git
git remote update kdave-btrfs-devel
git checkout 7da90930f2e2f7113cbe17431a63a1a71a7e9325
vim +/rb_node +2996 fs/btrfs/backref.c

7da90930f2e2f7 Qu Wenruo 2020-03-23  2961  =

7da90930f2e2f7 Qu Wenruo 2020-03-23  2962  /*
7da90930f2e2f7 Qu Wenruo 2020-03-23  2963   * Finish the upwards linkage cr=
eated by btrfs_backref_add_tree_node()
7da90930f2e2f7 Qu Wenruo 2020-03-23  2964   */
7da90930f2e2f7 Qu Wenruo 2020-03-23  2965  int btrfs_backref_finish_upper_l=
inks(struct btrfs_backref_cache *cache,
7da90930f2e2f7 Qu Wenruo 2020-03-23  2966  				     struct btrfs_backref_no=
de *start)
7da90930f2e2f7 Qu Wenruo 2020-03-23  2967  {
7da90930f2e2f7 Qu Wenruo 2020-03-23  2968  	struct list_head *useless_node =
=3D &cache->useless_node;
7da90930f2e2f7 Qu Wenruo 2020-03-23  2969  	struct btrfs_backref_edge *edge;
7da90930f2e2f7 Qu Wenruo 2020-03-23  2970  	struct rb_node *rb_node;
7da90930f2e2f7 Qu Wenruo 2020-03-23  2971  	LIST_HEAD(pending_edge);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2972  =

7da90930f2e2f7 Qu Wenruo 2020-03-23  2973  	ASSERT(start->checked);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2974  =

7da90930f2e2f7 Qu Wenruo 2020-03-23  2975  	/* Insert this node to cache if=
 it's not COW-only */
7da90930f2e2f7 Qu Wenruo 2020-03-23  2976  	if (!start->cowonly) {
7da90930f2e2f7 Qu Wenruo 2020-03-23  2977  		rb_node =3D rb_simple_insert(&=
cache->rb_root, start->bytenr,
7da90930f2e2f7 Qu Wenruo 2020-03-23  2978  					   &start->rb_node);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2979  		if (rb_node)
7da90930f2e2f7 Qu Wenruo 2020-03-23  2980  			btrfs_backref_panic(cache->fs=
_info, start->bytenr,
7da90930f2e2f7 Qu Wenruo 2020-03-23  2981  					    -EEXIST);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2982  		list_add_tail(&start->lower, &=
cache->leaves);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2983  	}
7da90930f2e2f7 Qu Wenruo 2020-03-23  2984  =

7da90930f2e2f7 Qu Wenruo 2020-03-23  2985  	/*
7da90930f2e2f7 Qu Wenruo 2020-03-23  2986  	 * Use breadth first search to =
iterate all related edges.
7da90930f2e2f7 Qu Wenruo 2020-03-23  2987  	 *
7da90930f2e2f7 Qu Wenruo 2020-03-23  2988  	 * The starting points are all =
the edges of this node
7da90930f2e2f7 Qu Wenruo 2020-03-23  2989  	 */
7da90930f2e2f7 Qu Wenruo 2020-03-23  2990  	list_for_each_entry(edge, &star=
t->upper, list[LOWER])
7da90930f2e2f7 Qu Wenruo 2020-03-23  2991  		list_add_tail(&edge->list[UPPE=
R], &pending_edge);
7da90930f2e2f7 Qu Wenruo 2020-03-23  2992  =

7da90930f2e2f7 Qu Wenruo 2020-03-23  2993  	while (!list_empty(&pending_edg=
e)) {
7da90930f2e2f7 Qu Wenruo 2020-03-23  2994  		struct btrfs_backref_node *upp=
er;
7da90930f2e2f7 Qu Wenruo 2020-03-23  2995  		struct btrfs_backref_node *low=
er;
7da90930f2e2f7 Qu Wenruo 2020-03-23 @2996  		struct rb_node *rb_node;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8976752739297141789==--

