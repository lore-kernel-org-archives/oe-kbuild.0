Content-Type: multipart/mixed; boundary="===============2659028575712564503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/rbtree.h:62:35: warning: use of uninitialized value 'parent' [CWE-457]
Date: Mon, 15 Aug 2022 02:04:03 +0800
Message-ID: <202208150213.CyDOzBRo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2659028575712564503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/rbtree.h:62:35: warning: use of uninitialized value 'parent'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aea23e7c464bfdec04b52cf61edb62030e9e0d0a
commit: c7e118cf98c7376e840fb73f096791ff61380310 btrfs: open code rbtree se=
arch in insert_state
date:   3 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150213.CyDOzBRo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc7e118cf98c7376e840fb73f096791ff61380310
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c7e118cf98c7376e840fb73f096791ff61380310
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:21,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from fs/btrfs/extent_io.c:4:
   In function 'rb_link_node',
       inlined from 'insert_state' at fs/btrfs/extent_io.c:572:2:
>> include/linux/rbtree.h:62:35: warning: use of uninitialized value 'paren=
t' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      62 |         node->__rb_parent_color =3D (unsigned long)parent;
         |                                   ^~~~~~~~~~~~~~~~~~~~~
     'btrfs_readahead_tree_block': events 1-6
       |
       |fs/btrfs/extent_io.c:7434:6:
       | 7434 | void btrfs_readahead_tree_block(struct btrfs_fs_info *fs_in=
fo,
       |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'btrfs_readahead_tree_block'
       |......
       | 7441 |         if (IS_ERR(eb))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 7444 |         if (btrfs_buffer_uptodate(eb, gen, 1)) {
       |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |            ||
       |      |            |(3) ...to here
       |      |            (4) following 'false' branch...
       |......
       | 7449 |         ret =3D read_extent_buffer_pages(eb, WAIT_NONE, 0);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (5) ...to here
       |      |               (6) calling 'read_extent_buffer_pages' from '=
btrfs_readahead_tree_block'
       |
       +--> 'read_extent_buffer_pages': events 7-8
              |
              | 6602 | int read_extent_buffer_pages(struct extent_buffer *e=
b, int wait, int mirror_num)
              |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
              |      |     |
              |      |     (7) entry to 'read_extent_buffer_pages'
              |......
              | 6616 |         if (test_bit(EXTENT_BUFFER_UPTODATE, &eb->bf=
lags))
              |      |            ~
              |      |            |
              |      |            (8) following 'false' branch...
              |
            'read_extent_buffer_pages': event 9
              |
              |include/asm-generic/bitops/non-atomic.h:118:27:
              |  118 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (B=
ITS_PER_LONG-1)));
              |      |                       ~~~~^~~~~~~~~~~~~~
              |      |                           |
              |      |                           (9) ...to here
              |
            'read_extent_buffer_pages': events 10-14
              |
              |fs/btrfs/extent_io.c:6624:12:
              | 6624 |         if (unlikely(test_bit(EXTENT_BUFFER_WRITE_ER=
R, &eb->bflags)))
              |      |            ^
              |      |            |
              |      |            (10) following 'false' branch...
              |......
              | 6627 |         if (eb->fs_info->nodesize < PAGE_SIZE)
              |      |            ~~~~~~~~~~~~
              |      |            |  |
              |      |            |  (11) ...to here
              |      |            (12) following 'true' branch...
              | 6628 |                 return read_extent_buffer_subpage(eb=
, wait, mirror_num);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (13) ...to here
              |      |                        (14) calling 'read_extent_buf=
fer_subpage' from 'read_extent_buffer_pages'
              |
              +--> 'read_extent_buffer_subpage': events 15-18
                     |
                     | 6540 | static int read_extent_buffer_subpage(struct =
extent_buffer *eb, int wait,
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (15) entry to 'read_extent_buffer_=
subpage'
                     |......
                     | 6555 |         if (wait =3D=3D WAIT_NONE) {
                     |      |            ~
                     |      |            |
                     |      |            (16) following 'true' branch (when=
 'wait =3D=3D 0')...
                     | 6556 |                 if (!try_lock_extent(io_tree,=
 eb->start, eb->start + eb->len - 1))
                     |      |                      ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                      |
                     |      |                      (17) ...to here
                     |      |                      (18) calling 'try_lock_e=
xtent' from 'read_extent_buffer_subpage'
                     |
                     +--> 'try_lock_extent': events 19-20
                            |
                            | 1486 | int try_lock_extent(struct extent_io_t=
ree *tree, u64 start, u64 end)
                            |      |     ^~~~~~~~~~~~~~~
                            |      |     |
                            |      |     (19) entry to 'try_lock_extent'
                            |......
                            | 1491 |         err =3D set_extent_bit(tree, s=
tart, end, EXTENT_LOCKED, EXTENT_LOCKED,
                            |      |               ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |               |
                            |      |               (20) calling 'set_extent=
_bit' from 'try_lock_extent'
                            | 1492 |                              &failed_s=
tart, NULL, GFP_NOFS, NULL);
                            |      |                              ~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |
                            +--> 'set_extent_bit': events 21-22
                                   |
                                   |  980 | int set_extent_bit(struct exten=
t_io_tree *tree, u64 start, u64 end, u32 bits,
--
                                          |      |                         |
                                          |      |                         =
(44) region created on stack here
                                          |......
                                          |  543 |         set_state_bits(t=
ree, state, bits, changeset);
                                          |      |         ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |         |
                                          |      |         (45) calling 'se=
t_state_bits' from 'insert_state'
                                          |
                                          +--> 'set_state_bits': events 46-=
47
                                                 |
                                                 |  932 | static void set_s=
tate_bits(struct extent_io_tree *tree,
                                                 |      |             ^~~~~=
~~~~~~~~~
                                                 |      |             |
                                                 |      |             (46) =
entry to 'set_state_bits'
                                                 |......
                                                 |  946 |         ret =3D a=
dd_extent_changeset(state, bits_to_set, changeset, 1);
                                                 |      |               ~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                 |      |               |
                                                 |      |               (47=
) calling 'add_extent_changeset' from 'set_state_bits'
                                                 |
                                                 +--> 'add_extent_changeset=
': events 48-49
                                                        |
                                                        |  164 | static int=
 add_extent_changeset(struct extent_state *state, u32 bits,
                                                        |      |           =
 ^~~~~~~~~~~~~~~~~~~~
                                                        |      |           =
 |
                                                        |      |           =
 (48) entry to 'add_extent_changeset'
                                                        |......
                                                        |  170 |         if=
 (!changeset)
                                                        |      |           =
 ~
                                                        |      |           =
 |
                                                        |      |           =
 (49) following 'true' branch (when 'changeset' is NULL)...
                                                        |
                                                      'add_extent_changeset=
': event 50
                                                        |
                                                        |cc1:
                                                        | (50): ...to here
                                                        |
                                                 <------+
                                                 |
                                               'set_state_bits': event 51
                                                 |
                                                 |  946 |         ret =3D a=
dd_extent_changeset(state, bits_to_set, changeset, 1);
                                                 |      |               ^~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                                 |      |               |
                                                 |      |               (51=
) returning to 'set_state_bits' from 'add_extent_changeset'
                                                 |
                                               'set_state_bits': event 52
                                                 |
                                                 |include/asm-generic/bug.h=
:71:35:
                                                 |   71 | #define BUG_ON(co=
ndition) do { if (unlikely(condition)) BUG(); } while (0)
                                                 |      |                  =
                 ^
                                                 |      |                  =
                 |
                                                 |      |                  =
                 (52) following 'false' branch...
   fs/btrfs/extent_io.c:947:9: note: in expansion of macro 'BUG_ON'
                                                 |  947 |         BUG_ON(re=
t < 0);
                                                 |      |         ^~~~~~
                                                 |
                                               'set_state_bits': event 53
                                                 |
                                                 |  948 |         state->st=
ate |=3D bits_to_set;
                                                 |      |         ~~~~~^~~~=
~~~
                                                 |      |              |
                                                 |      |              (53)=
 ...to here
                                                 |
                                          <------+
                                          |
                                        'insert_state': events 54-58
                                          |
                                          |  543 |         set_state_bits(t=
ree, state, bits, changeset);
                                          |      |         ^~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                          |      |         |
                                          |      |         (54) returning t=
o 'insert_state' from 'set_state_bits'
                                          |......
                                          |  546 |         if (node_in && p=
arent_in) {
                                          |      |            ~
                                          |      |            |
                                          |      |            (55) followin=
g 'false' branch...
                                          |......
                                          |  552 |         node =3D &tree->=
state.rb_node;
                                          |      |         ~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
                                          |      |              |
                                          |      |              (56) ...to =
here
                                          |  553 |         while (*node) {
                                          |      |                ~
                                          |      |                |
                                          |      |                (57) foll=
owing 'false' branch...
                                          |......
                                          |  571 | insert_new:
                                          |      | ~~~~~~~~~~
                                          |      | |
                                          |      | (58) ...to here
                                          |
                                        'insert_state': event 59
                                          |
                                          |include/linux/rbtree.h:62:35:
                                          |   62 |         node->__rb_paren=
t_color =3D (unsigned long)parent;
                                          |      |                         =
          ^~~~~~~~~~~~~~~~~~~~~
                                          |      |                         =
          |
                                          |      |                         =
          (59) use of uninitialized value 'parent' here
                                          |
>> include/linux/rbtree.h:62:35: warning: use of uninitialized value 'paren=
t' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     'btrfs_readahead_node_child': events 1-2
       |
       |fs/btrfs/extent_io.c:7464:6:
       | 7464 | void btrfs_readahead_node_child(struct extent_buffer *node,=
 int slot)
       |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'btrfs_readahead_node_child'
       | 7465 | {
       | 7466 |         btrfs_readahead_tree_block(node->fs_info,
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (2) calling 'btrfs_readahead_tree_block' from 'btrf=
s_readahead_node_child'
       | 7467 |                                    btrfs_node_blockptr(node=
, slot),
       |      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
       | 7468 |                                    btrfs_header_owner(node),
       |      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~
       | 7469 |                                    btrfs_node_ptr_generatio=
n(node, slot),
       |      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       | 7470 |                                    btrfs_header_level(node)=
 - 1);
       |      |                                    ~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |
       +--> 'btrfs_readahead_tree_block': events 3-8
              |
              | 7434 | void btrfs_readahead_tree_block(struct btrfs_fs_info=
 *fs_info,
              |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |      |
              |      |      (3) entry to 'btrfs_readahead_tree_block'
              |......
              | 7441 |         if (IS_ERR(eb))
              |      |            ~
              |      |            |
              |      |            (4) following 'false' branch...
              |......
              | 7444 |         if (btrfs_buffer_uptodate(eb, gen, 1)) {
              |      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            ||
              |      |            |(5) ...to here
              |      |            (6) following 'false' branch...
              |......
              | 7449 |         ret =3D read_extent_buffer_pages(eb, WAIT_NO=
NE, 0);
              |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
              |      |               |
              |      |               (7) ...to here
              |      |               (8) calling 'read_extent_buffer_pages'=
 from 'btrfs_readahead_tree_block'
              |
              +--> 'read_extent_buffer_pages': events 9-10
                     |
                     | 6602 | int read_extent_buffer_pages(struct extent_bu=
ffer *eb, int wait, int mirror_num)
                     |      |     ^~~~~~~~~~~~~~~~~~~~~~~~
                     |      |     |
                     |      |     (9) entry to 'read_extent_buffer_pages'
                     |......
                     | 6616 |         if (test_bit(EXTENT_BUFFER_UPTODATE, =
&eb->bflags))
                     |      |            ~
                     |      |            |
                     |      |            (10) following 'false' branch...
                     |
                   'read_extent_buffer_pages': event 11
                     |
                     |include/asm-generic/bitops/non-atomic.h:118:27:
                     |  118 |         return 1UL & (addr[BIT_WORD(nr)] >> (=
nr & (BITS_PER_LONG-1)));
                     |      |                       ~~~~^~~~~~~~~~~~~~
                     |      |                           |
                     |      |                           (11) ...to here
                     |
                   'read_extent_buffer_pages': events 12-16
                     |
                     |fs/btrfs/extent_io.c:6624:12:
                     | 6624 |         if (unlikely(test_bit(EXTENT_BUFFER_W=
RITE_ERR, &eb->bflags)))
                     |      |            ^
                     |      |            |
                     |      |            (12) following 'false' branch...
                     |......
                     | 6627 |         if (eb->fs_info->nodesize < PAGE_SIZE)
                     |      |            ~~~~~~~~~~~~
                     |      |            |  |
                     |      |            |  (13) ...to here
                     |      |            (14) following 'true' branch...
                     | 6628 |                 return read_extent_buffer_sub=
page(eb, wait, mirror_num);
                     |      |                        ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                        |
                     |      |                        (15) ...to here
                     |      |                        (16) calling 'read_ext=
ent_buffer_subpage' from 'read_extent_buffer_pages'
                     |
                     +--> 'read_extent_buffer_subpage': events 17-20
                            |
                            | 6540 | static int read_extent_buffer_subpage(=
struct extent_buffer *eb, int wait,
                            |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |            |
                            |      |            (17) entry to 'read_extent_=
buffer_subpage'
                            |......
                            | 6555 |         if (wait =3D=3D WAIT_NONE) {
                            |      |            ~
                            |      |            |
                            |      |            (18) following 'true' branc=
h (when 'wait =3D=3D 0')...
                            | 6556 |                 if (!try_lock_extent(i=
o_tree, eb->start, eb->start + eb->len - 1))
                            |      |                      ~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                      |
                            |      |                      (19) ...to here
                            |      |                      (20) calling 'try=
_lock_extent' from 'read_extent_buffer_subpage'

vim +/parent +62 include/linux/rbtree.h

9dee5c51516d2c Cody P Schafer    2013-09-11  52  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  53  /* Fast replacement of a s=
ingle node without remove/rebalance/add/rebalance */
^1da177e4c3f41 Linus Torvalds    2005-04-16  54  extern void rb_replace_nod=
e(struct rb_node *victim, struct rb_node *new,
^1da177e4c3f41 Linus Torvalds    2005-04-16  55  			    struct rb_root *roo=
t);
c1adf20052d80f David Howells     2016-07-01  56  extern void rb_replace_nod=
e_rcu(struct rb_node *victim, struct rb_node *new,
c1adf20052d80f David Howells     2016-07-01  57  				struct rb_root *root);
^1da177e4c3f41 Linus Torvalds    2005-04-16  58  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  59  static inline void rb_link=
_node(struct rb_node *node, struct rb_node *parent,
^1da177e4c3f41 Linus Torvalds    2005-04-16  60  				struct rb_node **rb_li=
nk)
^1da177e4c3f41 Linus Torvalds    2005-04-16  61  {
bf7ad8eeab9957 Michel Lespinasse 2012-10-08 @62  	node->__rb_parent_color =
=3D (unsigned long)parent;
^1da177e4c3f41 Linus Torvalds    2005-04-16  63  	node->rb_left =3D node->r=
b_right =3D NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  64  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  65  	*rb_link =3D node;
^1da177e4c3f41 Linus Torvalds    2005-04-16  66  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  67  =


:::::: The code at line 62 was first introduced by commit
:::::: bf7ad8eeab995710c766df49c9c69a8592ca0216 rbtree: move some implement=
ation details from rbtree.h to rbtree.c

:::::: TO: Michel Lespinasse <walken@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2659028575712564503==--

