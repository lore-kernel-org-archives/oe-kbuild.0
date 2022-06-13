Content-Type: multipart/mixed; boundary="===============5725464590691705775=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 49/57] fs/netfs/buffered_write.c:96:14: warning: dereference of NULL 'a' [CWE-476]
Date: Mon, 13 Jun 2022 08:29:36 +0800
Message-ID: <202206130814.Q99QS3hK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5725464590691705775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/netfs/=
buffered_write.c:96:14: warning: dereference of NULL 'a' [CWE-476] [-Wanaly=
zer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
linked-list
head:   c19d336b7f0c53bd31e73f6d7d6c1524f0df55b8
commit: ccf86b443c7819d2a0852d0dabee722cf5431f2c [49/57] netfs: Do copy-to-=
cache-on-read through VM writeback
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-c002-20220612 (https://download.01.org/0day-ci/archi=
ve/20220613/202206130814.Q99QS3hK-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/ccf86b443c7819d=
2a0852d0dabee722cf5431f2c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linke=
d-list
        git checkout ccf86b443c7819d2a0852d0dabee722cf5431f2c
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/gfp.h:5,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from fs/netfs/buffered_write.c:9:
   include/linux/page-flags.h: In function 'PageHead':
   include/linux/page-flags.h:788:27: warning: passing argument 1 of 'dump_=
page' discards 'const' qualifier from pointer target type [-Wdiscarded-qual=
ifiers]
     788 |         PF_POISONED_CHECK(page);
         |                           ^~~~
   include/linux/mmdebug.h:21:35: note: in definition of macro 'VM_BUG_ON_P=
AGE'
      21 |                         dump_page(page, "VM_BUG_ON_PAGE(" __stri=
ngify(cond)")");\
         |                                   ^~~~
   include/linux/page-flags.h:370:17: note: in expansion of macro 'VM_BUG_O=
N_PGFLAGS'
     370 |                 VM_BUG_ON_PGFLAGS(PagePoisoned(page), page);    =
        \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/page-flags.h:788:9: note: in expansion of macro 'PF_POISON=
ED_CHECK'
     788 |         PF_POISONED_CHECK(page);
         |         ^~~~~~~~~~~~~~~~~
   include/linux/mmdebug.h:12:29: note: expected 'struct page *' but argume=
nt is of type 'const struct page *'
      12 | void dump_page(struct page *page, const char *reason);
         |                ~~~~~~~~~~~~~^~~~
   fs/netfs/buffered_write.c: In function 'netfs_are_regions_mergeable':
>> fs/netfs/buffered_write.c:96:14: warning: dereference of NULL 'a' [CWE-4=
76] [-Wanalyzer-null-dereference]
      96 |         if (a->type =3D=3D NETFS_COPY_TO_CACHE ||
         |             ~^~~~~~
     'netfs_rreq_do_write_to_cache': event 1
       |
       |  908 | void netfs_rreq_do_write_to_cache(struct netfs_io_request *=
rreq)
       |      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'netfs_rreq_do_write_to_cache'
       |
     'netfs_rreq_do_write_to_cache': event 2
       |
       |include/linux/list.h:763:14:
       |  763 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (2) following 'false' branch...
   fs/netfs/buffered_write.c:914:9: note: in expansion of macro 'list_for_e=
ach_entry_safe'
       |  914 |         list_for_each_entry_safe(subreq, p, &rreq->subreque=
sts, rreq_link) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
     'netfs_rreq_do_write_to_cache': event 3
       |
       |include/linux/list.h:674:9:
       |  674 |         for (pos =3D list_first_entry(head, typeof(*pos), m=
ember);        \
       |      |         ^~~
       |      |         |
       |      |         (3) ...to here
   fs/netfs/buffered_write.c:922:9: note: in expansion of macro 'list_for_e=
ach_entry'
       |  922 |         list_for_each_entry(subreq, &rreq->subrequests, rre=
q_link) {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'netfs_rreq_do_write_to_cache': event 4
       |
       |include/linux/list.h:675:14:
       |  675 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (4) following 'true' branch...
   fs/netfs/buffered_write.c:922:9: note: in expansion of macro 'list_for_e=
ach_entry'
       |  922 |         list_for_each_entry(subreq, &rreq->subrequests, rre=
q_link) {
       |      |         ^~~~~~~~~~~~~~~~~~~
       |
     'netfs_rreq_do_write_to_cache': events 5-6
       |
       |  923 |                 loff_t start =3D subreq->start;
       |      |                 ^~~~~~
       |      |                 |
       |      |                 (5) ...to here
       |......
       |  937 |                 netfs_copy_to_cache(rreq, start, len);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (6) calling 'netfs_copy_to_cache' from 'net=
fs_rreq_do_write_to_cache'
       |
       +--> 'netfs_copy_to_cache': events 7-8
              |
              |  887 | static void netfs_copy_to_cache(struct netfs_io_requ=
est *rreq,
              |      |             ^~~~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'netfs_copy_to_cache'
              |......
              |  898 |         netfs_commit_region(ctx, NULL, &proposal);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (8) calling 'netfs_commit_region' from 'netf=
s_copy_to_cache'
              |
              +--> 'netfs_commit_region': events 9-10
                     |
                     |  382 | static void netfs_commit_region(struct netfs_=
inode *ctx, struct file *file,
                     |      |             ^~~~~~~~~~~~~~~~~~~
                     |      |             |
                     |      |             (9) entry to 'netfs_commit_region'
                     |......
                     |  400 |         target =3D netfs_find_region(ctx, pro=
posal->first, proposal->last);
                     |      |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                  |
                     |      |                  (10) calling 'netfs_find_reg=
ion' from 'netfs_commit_region'
                     |
                     +--> 'netfs_find_region': event 11
                            |
                            |   73 | struct netfs_dirty_region *netfs_find_=
region(struct netfs_inode *ctx,
                            |      |                            ^~~~~~~~~~~=
~~~~~~
                            |      |                            |
                            |      |                            (11) entry =
to 'netfs_find_region'
                            |
                          'netfs_find_region': event 12
                            |
                            |include/linux/list.h:675:14:
                            |  675 |              !list_entry_is_head(pos, =
head, member);                    \
                            |      |              ^
                            |      |              |
                            |      |              (12) following 'true' bra=
nch...
   fs/netfs/buffered_write.c:78:9: note: in expansion of macro 'list_for_ea=
ch_entry'
                            |   78 |         list_for_each_entry(r, &ctx->d=
irty_regions, dirty_link) {
                            |      |         ^~~~~~~~~~~~~~~~~~~
                            |
                          'netfs_find_region': event 13
                            |
                            |   79 |                 if (r->first > last)
                            |      |                 ^~

vim +/a +96 fs/netfs/buffered_write.c

b816d9b8d7d847 David Howells 2021-06-17   87  =

b816d9b8d7d847 David Howells 2021-06-17   88  /*
b816d9b8d7d847 David Howells 2021-06-17   89   * Return true if two dirty r=
egions are compatible such that b can be merged
b816d9b8d7d847 David Howells 2021-06-17   90   * onto the end of a.
b816d9b8d7d847 David Howells 2021-06-17   91   */
b816d9b8d7d847 David Howells 2021-06-17   92  bool netfs_are_regions_mergea=
ble(struct netfs_inode *ctx,
b816d9b8d7d847 David Howells 2021-06-17   93  				 const struct netfs_dirty=
_region *a,
b816d9b8d7d847 David Howells 2021-06-17   94  				 const struct netfs_dirty=
_region *b)
b816d9b8d7d847 David Howells 2021-06-17   95  {
ccf86b443c7819 David Howells 2021-07-07  @96  	if (a->type =3D=3D NETFS_COP=
Y_TO_CACHE ||
ccf86b443c7819 David Howells 2021-07-07   97  	    b->type =3D=3D NETFS_COP=
Y_TO_CACHE)
ccf86b443c7819 David Howells 2021-07-07   98  		return false;
b816d9b8d7d847 David Howells 2021-06-17   99  	if (b->from > a->to &&
b816d9b8d7d847 David Howells 2021-06-17  100  	    b->from < ctx->zero_poin=
t)
b816d9b8d7d847 David Howells 2021-06-17  101  		return false;
b816d9b8d7d847 David Howells 2021-06-17  102  	if (ctx->ops->are_regions_me=
rgeable)
b816d9b8d7d847 David Howells 2021-06-17  103  		return ctx->ops->are_region=
s_mergeable(ctx, a, b);
b816d9b8d7d847 David Howells 2021-06-17  104  	return true;
b816d9b8d7d847 David Howells 2021-06-17  105  }
b816d9b8d7d847 David Howells 2021-06-17  106  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5725464590691705775==--

