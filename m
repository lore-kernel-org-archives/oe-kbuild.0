Content-Type: multipart/mixed; boundary="===============7378166304984927587=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 14/36] btrfs: temporarily export and then move extent state helpers
Date: Thu, 15 Sep 2022 08:45:37 +0800
Message-ID: <202209150801.PJi3KPXx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7378166304984927587==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <51721f4bfbba615dcf597116046ad0d11499b0d9.1662760286.git.josef=
@toxicpanda.com>
References: <51721f4bfbba615dcf597116046ad0d11499b0d9.1662760286.git.josef(=
a)toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>

Hi Josef,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kdave/for-next]
[cannot apply to rostedt-trace/for-next linus/master v6.0-rc5 next-20220914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/btrfs-mo=
ve-extent_io_tree-code-and-cleanups/20220910-055740
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: microblaze-randconfig-m041-20220914 (https://download.01.org/0day-c=
i/archive/20220915/202209150801.PJi3KPXx-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/btrfs/extent-io-tree.c:394 insert_state() error: uninitialized symbol 'p=
arent'.

vim +/parent +394 fs/btrfs/extent-io-tree.c

e5d0c5e19c2dff Josef Bacik 2022-09-09  355  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  356  /*
e5d0c5e19c2dff Josef Bacik 2022-09-09  357   * insert an extent_state struc=
t into the tree.  'bits' are set on the
e5d0c5e19c2dff Josef Bacik 2022-09-09  358   * struct before it is inserted.
e5d0c5e19c2dff Josef Bacik 2022-09-09  359   *
e5d0c5e19c2dff Josef Bacik 2022-09-09  360   * This may return -EEXIST if t=
he extent is already there, in which case the
e5d0c5e19c2dff Josef Bacik 2022-09-09  361   * state struct is freed.
e5d0c5e19c2dff Josef Bacik 2022-09-09  362   *
e5d0c5e19c2dff Josef Bacik 2022-09-09  363   * The tree lock is not taken i=
nternally.  This is a utility function and
e5d0c5e19c2dff Josef Bacik 2022-09-09  364   * probably isn't what you want=
 to call (see set/clear_extent_bit).
e5d0c5e19c2dff Josef Bacik 2022-09-09  365   */
e5d0c5e19c2dff Josef Bacik 2022-09-09  366  int insert_state(struct extent_=
io_tree *tree, struct extent_state *state,
e5d0c5e19c2dff Josef Bacik 2022-09-09  367  		 u32 bits, struct extent_chan=
geset *changeset)
e5d0c5e19c2dff Josef Bacik 2022-09-09  368  {
e5d0c5e19c2dff Josef Bacik 2022-09-09  369  	struct rb_node **node;
e5d0c5e19c2dff Josef Bacik 2022-09-09  370  	struct rb_node *parent;
e5d0c5e19c2dff Josef Bacik 2022-09-09  371  	const u64 end =3D state->end;
e5d0c5e19c2dff Josef Bacik 2022-09-09  372  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  373  	set_state_bits(tree, state, bi=
ts, changeset);
e5d0c5e19c2dff Josef Bacik 2022-09-09  374  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  375  	node =3D &tree->state.rb_node;
e5d0c5e19c2dff Josef Bacik 2022-09-09  376  	while (*node) {
e5d0c5e19c2dff Josef Bacik 2022-09-09  377  		struct tree_entry *entry;
e5d0c5e19c2dff Josef Bacik 2022-09-09  378  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  379  		parent =3D *node;
e5d0c5e19c2dff Josef Bacik 2022-09-09  380  		entry =3D rb_entry(parent, st=
ruct tree_entry, rb_node);
e5d0c5e19c2dff Josef Bacik 2022-09-09  381  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  382  		if (end < entry->start) {
e5d0c5e19c2dff Josef Bacik 2022-09-09  383  			node =3D &(*node)->rb_left;
e5d0c5e19c2dff Josef Bacik 2022-09-09  384  		} else if (end > entry->end) {
e5d0c5e19c2dff Josef Bacik 2022-09-09  385  			node =3D &(*node)->rb_right;
e5d0c5e19c2dff Josef Bacik 2022-09-09  386  		} else {
e5d0c5e19c2dff Josef Bacik 2022-09-09  387  			btrfs_err(tree->fs_info,
e5d0c5e19c2dff Josef Bacik 2022-09-09  388  			       "found node %llu %llu=
 on insert of %llu %llu",
e5d0c5e19c2dff Josef Bacik 2022-09-09  389  			       entry->start, entry->=
end, state->start, end);
e5d0c5e19c2dff Josef Bacik 2022-09-09  390  			return -EEXIST;
e5d0c5e19c2dff Josef Bacik 2022-09-09  391  		}
e5d0c5e19c2dff Josef Bacik 2022-09-09  392  	}
e5d0c5e19c2dff Josef Bacik 2022-09-09  393  =

e5d0c5e19c2dff Josef Bacik 2022-09-09 @394  	rb_link_node(&state->rb_node, =
parent, node);
e5d0c5e19c2dff Josef Bacik 2022-09-09  395  	rb_insert_color(&state->rb_nod=
e, &tree->state);
e5d0c5e19c2dff Josef Bacik 2022-09-09  396  =

e5d0c5e19c2dff Josef Bacik 2022-09-09  397  	merge_state(tree, state);
e5d0c5e19c2dff Josef Bacik 2022-09-09  398  	return 0;
e5d0c5e19c2dff Josef Bacik 2022-09-09  399  }
e5d0c5e19c2dff Josef Bacik 2022-09-09  400  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7378166304984927587==--

