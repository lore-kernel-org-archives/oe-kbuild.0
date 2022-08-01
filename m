Content-Type: multipart/mixed; boundary="===============8272798109449054536=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/cifs/fscache.c:241:23: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 02 Aug 2022 05:00:18 +0800
Message-ID: <202208020440.2UM83bxo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8272798109449054536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/cifs/f=
scache.c:241:23: warning: use of uninitialized value '<unknown>' [CWE-457] =
[-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0cec3f24a7cedc726f8790d693aaff2c535dc4ce
commit: 0174ee9947bd0f24fee2794b35258960d108b7aa cifs: Implement cache I/O =
by accessing the cache directly
date:   6 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208020440.2UM83bxo-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0174ee9947bd0f24fee2794b35258960d108b7aa
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0174ee9947bd0f24fee2794b35258960d108b7aa
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from fs/cifs/fscache.h:13,
                    from fs/cifs/fscache.c:9:
   In function 'fscache_read',
       inlined from 'fscache_fallback_read_page' at fs/cifs/fscache.c:166:8:
   include/linux/fscache.h:499:19: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     499 |         return ops->read(cres, start_pos, iter, read_hole,
         |                ~~~^~~~~~
     'fscache_fallback_read_page': event 1
       |
       |fs/cifs/fscache.c:163:12:
       |  163 |         if (ret < 0)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'ret >=3D 0')=
...
       |
     'fscache_fallback_read_page': event 2
       |
       |include/linux/pagemap.h:687:29:
       |  687 |         return ((loff_t)page->index) << PAGE_SHIFT;
       |      |                         ~~~~^~~~~~~
       |      |                             |
       |      |                             (2) ...to here
       |
     'fscache_fallback_read_page': events 3-5
       |
       |include/linux/fscache.h:426:58:
       |  426 |         return fscache_resources_valid(cres) ? cres->ops : =
NULL;
       |......
       |  499 |         return ops->read(cres, start_pos, iter, read_hole,
       |      |                ~~~~~~~~~                                  =

       |      |                   |
       |      |                   (4) ...to here
       |      |                   (5) dereference of NULL '<unknown>'
       |
   In function 'fscache_write',
       inlined from 'fscache_fallback_write_page' at fs/cifs/fscache.c:199:=
9:
   include/linux/fscache.h:557:19: warning: dereference of NULL '0' [CWE-47=
6] [-Wanalyzer-null-dereference]
     557 |         return ops->write(cres, start_pos, iter, term_func, term=
_func_priv);
         |                ~~~^~~~~~~
     'fscache_fallback_write_page': events 1-3
       |
       |fs/cifs/fscache.c:193:12:
       |  193 |         if (ret < 0)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'ret >=3D 0')=
...
       |......
       |  196 |         ret =3D cres.ops->prepare_write(&cres, &start, &len=
, i_size_read(inode),
       |      |               ~~~~~~~~
       |      |                   |
       |      |                   (2) ...to here
       |  197 |                                       no_space_allocated_ye=
t);
       |  198 |         if (ret =3D=3D 0)
       |      |            ~
       |      |            |
       |      |            (3) following 'true' branch (when 'ret =3D=3D 0'=
)...
       |
     'fscache_fallback_write_page': event 4
       |
       |include/linux/pagemap.h:687:29:
       |  687 |         return ((loff_t)page->index) << PAGE_SHIFT;
       |      |                         ~~~~^~~~~~~
       |      |                             |
       |      |                             (4) ...to here
       |
     'fscache_fallback_write_page': events 5-7
       |
       |include/linux/fscache.h:426:58:
       |  426 |         return fscache_resources_valid(cres) ? cres->ops : =
NULL;
       |......
       |  557 |         return ops->write(cres, start_pos, iter, term_func,=
 term_func_priv);
       |      |                ~~~~~~~~~~                                 =

       |      |                   |
       |      |                   (6) ...to here
       |      |                   (7) dereference of NULL '<unknown>'
       |
   fs/cifs/fscache.c: In function '__cifs_fscache_query_occupancy':
>> fs/cifs/fscache.c:241:23: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     241 |         loff_t start, data_start;
         |                       ^~~~~~~~~~
     '__cifs_fscache_query_occupancy': event 1
       |
       |  241 |         loff_t start, data_start;
       |      |                       ^~~~~~~~~~
       |      |                       |
       |      |                       (1) use of uninitialized value '<unkn=
own>' here
       |
   fs/cifs/fscache.c:242:21: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     242 |         size_t len, data_len;
         |                     ^~~~~~~~
     '__cifs_fscache_query_occupancy': event 1
       |
       |  242 |         size_t len, data_len;
       |      |                     ^~~~~~~~
       |      |                     |
       |      |                     (1) use of uninitialized value '<unknow=
n>' here
       |

vim +241 fs/cifs/fscache.c

0174ee9947bd0f David Howells 2022-01-27  230  =

0174ee9947bd0f David Howells 2022-01-27  231  /*
0174ee9947bd0f David Howells 2022-01-27  232   * Query the cache occupancy.
0174ee9947bd0f David Howells 2022-01-27  233   */
0174ee9947bd0f David Howells 2022-01-27  234  int __cifs_fscache_query_occu=
pancy(struct inode *inode,
0174ee9947bd0f David Howells 2022-01-27  235  				   pgoff_t first, unsigne=
d int nr_pages,
0174ee9947bd0f David Howells 2022-01-27  236  				   pgoff_t *_data_first,
0174ee9947bd0f David Howells 2022-01-27  237  				   unsigned int *_data_nr=
_pages)
0174ee9947bd0f David Howells 2022-01-27  238  {
0174ee9947bd0f David Howells 2022-01-27  239  	struct netfs_cache_resources=
 cres;
0174ee9947bd0f David Howells 2022-01-27  240  	struct fscache_cookie *cooki=
e =3D cifs_inode_cookie(inode);
0174ee9947bd0f David Howells 2022-01-27 @241  	loff_t start, data_start;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8272798109449054536==--

