Content-Type: multipart/mixed; boundary="===============1758319255924495167=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 28/44] fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Date: Sat, 23 Apr 2022 10:48:36 +0800
Message-ID: <202204231033.qyU1NK2X-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1758319255924495167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
maple
head:   931e50676c6598d0eda1954ead465519ff91874d
commit: 777536e6af57becf14b8f4f34007ed3e3a95c911 [28/44] netfs: Perform con=
tent encryption
:::::: branch date: 11 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
423/202204231033.qyU1NK2X-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.

vim +/ret +43 fs/netfs/crypto.c

777536e6af57bec David Howells 2021-07-01  14  =

777536e6af57bec David Howells 2021-07-01  15  /*
777536e6af57bec David Howells 2021-07-01  16   * Allocate a bunch of pages =
and add them into the xarray buffer starting at
777536e6af57bec David Howells 2021-07-01  17   * the given index.
777536e6af57bec David Howells 2021-07-01  18   */
777536e6af57bec David Howells 2021-07-01  19  int netfs_alloc_buffer(struct=
 xarray *xa, pgoff_t index, unsigned int nr_pages)
777536e6af57bec David Howells 2021-07-01  20  {
777536e6af57bec David Howells 2021-07-01  21  	struct page *page;
777536e6af57bec David Howells 2021-07-01  22  	unsigned int n;
777536e6af57bec David Howells 2021-07-01  23  	int ret;
777536e6af57bec David Howells 2021-07-01  24  	LIST_HEAD(list);
777536e6af57bec David Howells 2021-07-01  25  =

777536e6af57bec David Howells 2021-07-01  26  	n =3D alloc_pages_bulk_list(=
GFP_NOIO, nr_pages, &list);
777536e6af57bec David Howells 2021-07-01  27  	if (n < nr_pages) {
777536e6af57bec David Howells 2021-07-01  28  		ret =3D -ENOMEM;
777536e6af57bec David Howells 2021-07-01  29  	}
777536e6af57bec David Howells 2021-07-01  30  =

777536e6af57bec David Howells 2021-07-01  31  	while ((page =3D list_first_=
entry_or_null(&list, struct page, lru))) {
777536e6af57bec David Howells 2021-07-01  32  		list_del(&page->lru);
777536e6af57bec David Howells 2021-07-01  33  		page->index =3D index;
777536e6af57bec David Howells 2021-07-01  34  		ret =3D xa_insert(xa, index=
++, page, GFP_NOIO);
777536e6af57bec David Howells 2021-07-01  35  		if (ret < 0)
777536e6af57bec David Howells 2021-07-01  36  			break;
777536e6af57bec David Howells 2021-07-01  37  	}
777536e6af57bec David Howells 2021-07-01  38  =

777536e6af57bec David Howells 2021-07-01  39  	while ((page =3D list_first_=
entry_or_null(&list, struct page, lru))) {
777536e6af57bec David Howells 2021-07-01  40  		list_del(&page->lru);
777536e6af57bec David Howells 2021-07-01  41  		__free_page(page);
777536e6af57bec David Howells 2021-07-01  42  	}
777536e6af57bec David Howells 2021-07-01 @43  	return ret;
777536e6af57bec David Howells 2021-07-01  44  }
777536e6af57bec David Howells 2021-07-01  45  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1758319255924495167==--

