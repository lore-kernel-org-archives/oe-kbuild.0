Content-Type: multipart/mixed; boundary="===============5322181365428261403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6241/7172] fs/f2fs/f2fs.h:2376:9: warning: use of uninitialized value 'ino' [CWE-457]
Date: Thu, 15 Sep 2022 08:55:55 +0800
Message-ID: <202209150827.Ldph2OJT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5322181365428261403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 fs/f2fs/f2fs.h:2376:9: warning: use of uninitialized value 'ino' [CWE-457]=
 [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f117c01187301a087412bd6697fcf5463cb427d8
commit: 64c11570d64d143fa212c2739bf743e8e8b9095c [6241/7172] f2fs: fix to d=
o sanity check on summary info
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220911 (https://download.01.org/0day-ci/archi=
ve/20220915/202209150827.Ldph2OJT-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D64c11570d64d143fa212c2739bf743e8e8b9095c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 64c11570d64d143fa212c2739bf743e8e8b9095c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
              |      |                    ~
              |      |                    |
              |      |                    (34) following 'false' branch...
              |......
              |  763 |                 if (!is_recoverable_dnode(page)) {
              |      |                    ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    | |
              |      |                    | (35) ...to here
              |      |                    (36) following 'true' branch...
              |
            'recover_data': event 37
              |
              |include/asm-generic/memory_model.h:19:57:
              |   19 | #define __page_to_pfn(page)     ((unsigned long)((pa=
ge) - mem_map) + \
              |      |                                                     =
    ^
              |      |                                                     =
    |
              |      |                                                     =
    (37) ...to here
   arch/arm/include/asm/memory.h:328:71: note: in definition of macro '__va'
              |  328 | #define __va(x)                 ((void *)__phys_to_v=
irt((phys_addr_t)(x)))
              |      |                                                     =
                  ^
   include/linux/mm.h:114:30: note: in expansion of macro 'PFN_PHYS'
              |  114 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)=
))
              |      |                              ^~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '_=
_page_to_pfn'
              |   52 | #define page_to_pfn __page_to_pfn
              |      |                     ^~~~~~~~~~~~~
   include/linux/mm.h:114:39: note: in expansion of macro 'page_to_pfn'
              |  114 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)=
))
              |      |                                       ^~~~~~~~~~~
   include/linux/mm.h:1682:16: note: in expansion of macro 'page_to_virt'
              | 1682 |         return page_to_virt(page);
              |      |                ^~~~~~~~~~~~
              |
            'recover_data': event 38
              |
              |include/linux/list.h:675:14:
              |  675 |              !list_entry_is_head(pos, head, member);=
                    \
              |      |              ^
              |      |              |
              |      |              (38) following 'true' branch...
   fs/f2fs/recovery.c:71:9: note: in expansion of macro 'list_for_each_entr=
y'
              |   71 |         list_for_each_entry(entry, head, list)
              |      |         ^~~~~~~~~~~~~~~~~~~
              |
            'recover_data': events 39-40
              |
              |   72 |                 if (entry->inode->i_ino =3D=3D ino)
              |      |                     ~~~~~^~~~~~~
              |      |                          |
              |      |                          (39) ...to here
              |......
              |  769 |                 if (!entry)
              |      |                    ~      =

              |      |                    |
              |      |                    (40) following 'false' branch...
              |
            'recover_data': event 41
              |
              |fs/f2fs/f2fs.h:2847:37:
              | 2847 | #define RAW_IS_INODE(p) ((p)->footer.nid =3D=3D (p)-=
>footer.ino)
              |      |                          ~~~~~~~~~~~^~~~
              |      |                                     |
              |      |                                     (41) ...to here
   fs/f2fs/f2fs.h:2853:16: note: in expansion of macro 'RAW_IS_INODE'
              | 2853 |         return RAW_IS_INODE(p);
              |      |                ^~~~~~~~~~~~
              |
            'recover_data': events 42-46
              |
              |fs/f2fs/recovery.c:776:20:
              |  776 |                 if (IS_INODE(page)) {
              |      |                    ^
              |      |                    |
              |      |                    (42) following 'false' branch...
              |......
              |  783 |                 if (entry->last_dentry =3D=3D blkadd=
r) {
              |      |                    ~~~~~~~~~~~~~~~~~~~
              |      |                    |     |
              |      |                    |     (43) ...to here
              |      |                    (44) following 'true' branch...
              |  784 |                         err =3D recover_dentry(entry=
->inode, page, dir_list);
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~
              |      |                               |
              |      |                               (45) ...to here
              |      |                               (46) calling 'recover_=
dentry' from 'recover_data'
              |
              +--> 'recover_dentry': events 47-48
                     |
                     |  167 | static int recover_dentry(struct inode *inode=
, struct page *ipage,
                     |      |            ^~~~~~~~~~~~~~
                     |      |            |
                     |      |            (47) entry to 'recover_dentry'
                     |......
                     |  175 |         struct page *page;
                     |      |                      ~~~~
                     |      |                      |
                     |      |                      (48) use of uninitialize=
d value '<unknown>' here
                     |
   In file included from fs/f2fs/recovery.c:12:
   fs/f2fs/recovery.c: In function 'check_index_in_prev_nodes':
>> fs/f2fs/f2fs.h:2376:9: warning: use of uninitialized value 'ino' [CWE-45=
7] [-Wanalyzer-use-of-uninitialized-value]
    2376 |         f2fs_printk(sbi, KERN_ERR fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/recovery.c:508:17: note: in expansion of macro 'f2fs_err'
     508 |                 f2fs_err(sbi, "Inconsistent ofs_in_node:%u in su=
mmary, ino:%u, nid:%u, max:%u",
         |                 ^~~~~~~~
     'f2fs_recover_fsync_data': events 1-2
       |
       |  813 | int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool =
check_only)
       |      |     ^~~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'f2fs_recover_fsync_data'
       |......
       |  844 |         err =3D find_fsync_dnodes(sbi, &inode_list, check_o=
nly);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |               |
       |      |               (2) calling 'find_fsync_dnodes' from 'f2fs_re=
cover_fsync_data'
       |
       +--> 'find_fsync_dnodes': event 3
              |
              |  363 | static int find_fsync_dnodes(struct f2fs_sb_info *sb=
i, struct list_head *head,
              |      |            ^~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'find_fsync_dnodes'
              |
            'find_fsync_dnodes': event 4
              |
              |fs/f2fs/segment.h:71:46:
              |   71 |         (SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :      =
                    \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                                              |
              |      |                                              (4) fol=
lowing 'true' branch...
              |   72 |                 le32_to_cpu(F2FS_RAW_SUPER(sbi)->seg=
ment0_blkaddr))
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   fs/f2fs/segment.h:86:34: note: in expansion of macro 'SEG0_BLKADDR'
              |   86 | #define START_BLOCK(sbi, segno) (SEG0_BLKADDR(sbi) +=
                    \
              |      |                                  ^~~~~~~~~~~~
   fs/f2fs/segment.h:90:10: note: in expansion of macro 'START_BLOCK'
              |   90 |         (START_BLOCK(sbi, (curseg)->segno) + (curseg=
)->next_blkoff)
              |      |          ^~~~~~~~~~~
   fs/f2fs/recovery.c:377:19: note: in expansion of macro 'NEXT_FREE_BLKADD=
R'
              |  377 |         blkaddr =3D NEXT_FREE_BLKADDR(sbi, curseg);
              |      |                   ^~~~~~~~~~~~~~~~~
              |
            'find_fsync_dnodes': event 5
              |
              |fs/f2fs/segment.h:71:46:
              |   71 |         (SM_I(sbi) ? SM_I(sbi)->seg0_blkaddr :      =
                    \
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
              |      |                                              |
              |      |                                              (5) ...=
to here
              |   72 |                 le32_to_cpu(F2FS_RAW_SUPER(sbi)->seg=
ment0_blkaddr))
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
   fs/f2fs/segment.h:86:34: note: in expansion of macro 'SEG0_BLKADDR'
              |   86 | #define START_BLOCK(sbi, segno) (SEG0_BLKADDR(sbi) +=
                    \
              |      |                                  ^~~~~~~~~~~~
   fs/f2fs/segment.h:90:10: note: in expansion of macro 'START_BLOCK'
              |   90 |         (START_BLOCK(sbi, (curseg)->segno) + (curseg=
)->next_blkoff)
              |      |          ^~~~~~~~~~~
   fs/f2fs/recovery.c:377:19: note: in expansion of macro 'NEXT_FREE_BLKADD=
R'
              |  377 |         blkaddr =3D NEXT_FREE_BLKADDR(sbi, curseg);
              |      |                   ^~~~~~~~~~~~~~~~~
              |
            'find_fsync_dnodes': event 6
              |
              |  392 |                         f2fs_put_page(page, 1);
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (6) calling 'f2fs_put_page' =
from 'find_fsync_dnodes'
              |
              +--> 'f2fs_put_page': events 7-10
                     |
                     |fs/f2fs/f2fs.h:2750:20:
                     | 2750 | static inline void f2fs_put_page(struct page =
*page, int unlock)
                     |      |                    ^~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (7) entry to 'f2fs_put_pag=
e'
                     | 2751 | {
                     | 2752 |         if (!page)
                     |      |            ~        =

                     |      |            |
                     |      |            (8) following 'false' branch (when=
 'page' is non-NULL)...
                     |......
                     | 2755 |         if (unlock) {
                     |      |            ~        =

                     |      |            |
                     |      |            (9) ...to here
                     |      |            (10) following 'true' branch (when=
 'unlock !=3D 0')...
                     |
                   'f2fs_put_page': event 11
                     |
                     |include/asm-generic/rwonce.h:44:26:
                     |   44 | #define __READ_ONCE(x)  (*(const volatile __u=
nqual_scalar_typeof(x) *)&(x))
                     |      |                         ~^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
                     |      |                          (11) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
                     |   50 |         __READ_ONCE(x);                      =
                           \
                     |      |         ^~~~~~~~~~~
   include/linux/page-flags.h:253:30: note: in expansion of macro 'READ_ONC=
E'
                     |  253 |         unsigned long head =3D READ_ONCE(page=
->compound_head);

vim +/ino +2376 fs/f2fs/f2fs.h

dcbb4c10e6d9693 Joe Perches 2019-06-18  2374  =

dcbb4c10e6d9693 Joe Perches 2019-06-18  2375  #define f2fs_err(sbi, fmt, ..=
.)						\
dcbb4c10e6d9693 Joe Perches 2019-06-18 @2376  	f2fs_printk(sbi, KERN_ERR fm=
t, ##__VA_ARGS__)
dcbb4c10e6d9693 Joe Perches 2019-06-18  2377  #define f2fs_warn(sbi, fmt, .=
..)					\
dcbb4c10e6d9693 Joe Perches 2019-06-18  2378  	f2fs_printk(sbi, KERN_WARNIN=
G fmt, ##__VA_ARGS__)
dcbb4c10e6d9693 Joe Perches 2019-06-18  2379  #define f2fs_notice(sbi, fmt,=
 ...)					\
dcbb4c10e6d9693 Joe Perches 2019-06-18  2380  	f2fs_printk(sbi, KERN_NOTICE=
 fmt, ##__VA_ARGS__)
dcbb4c10e6d9693 Joe Perches 2019-06-18  2381  #define f2fs_info(sbi, fmt, .=
..)					\
dcbb4c10e6d9693 Joe Perches 2019-06-18  2382  	f2fs_printk(sbi, KERN_INFO f=
mt, ##__VA_ARGS__)
dcbb4c10e6d9693 Joe Perches 2019-06-18  2383  #define f2fs_debug(sbi, fmt, =
...)					\
dcbb4c10e6d9693 Joe Perches 2019-06-18  2384  	f2fs_printk(sbi, KERN_DEBUG =
fmt, ##__VA_ARGS__)
dcbb4c10e6d9693 Joe Perches 2019-06-18  2385  =


:::::: The code at line 2376 was first introduced by commit
:::::: dcbb4c10e6d9693cc9d6fa493b4d130b66a60c7d f2fs: introduce f2fs_<level=
> macros to wrap f2fs_printk()

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5322181365428261403==--

