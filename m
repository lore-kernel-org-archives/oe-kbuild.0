Content-Type: multipart/mixed; boundary="===============2856086201257471960=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-maple 26/40] fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Date: Tue, 05 Apr 2022 13:40:45 +0800
Message-ID: <202204051340.At3NtdJb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2856086201257471960==
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
head:   674eea41fc70a740ff83ec590f9833f805852464
commit: fc693b2e39df6567a0312f21bb9004e1d7983286 [26/40] netfs: Perform con=
tent encryption
:::::: branch date: 13 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20405/202204051340.At3NtdJb-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.

vim +/ret +43 fs/netfs/crypto.c

fc693b2e39df65 David Howells 2021-07-01  14  =

fc693b2e39df65 David Howells 2021-07-01  15  /*
fc693b2e39df65 David Howells 2021-07-01  16   * Allocate a bunch of pages a=
nd add them into the xarray buffer starting at
fc693b2e39df65 David Howells 2021-07-01  17   * the given index.
fc693b2e39df65 David Howells 2021-07-01  18   */
fc693b2e39df65 David Howells 2021-07-01  19  int netfs_alloc_buffer(struct =
xarray *xa, pgoff_t index, unsigned int nr_pages)
fc693b2e39df65 David Howells 2021-07-01  20  {
fc693b2e39df65 David Howells 2021-07-01  21  	struct page *page;
fc693b2e39df65 David Howells 2021-07-01  22  	unsigned int n;
fc693b2e39df65 David Howells 2021-07-01  23  	int ret;
fc693b2e39df65 David Howells 2021-07-01  24  	LIST_HEAD(list);
fc693b2e39df65 David Howells 2021-07-01  25  =

fc693b2e39df65 David Howells 2021-07-01  26  	n =3D alloc_pages_bulk_list(G=
FP_NOIO, nr_pages, &list);
fc693b2e39df65 David Howells 2021-07-01  27  	if (n < nr_pages) {
fc693b2e39df65 David Howells 2021-07-01  28  		ret =3D -ENOMEM;
fc693b2e39df65 David Howells 2021-07-01  29  	}
fc693b2e39df65 David Howells 2021-07-01  30  =

fc693b2e39df65 David Howells 2021-07-01  31  	while ((page =3D list_first_e=
ntry_or_null(&list, struct page, lru))) {
fc693b2e39df65 David Howells 2021-07-01  32  		list_del(&page->lru);
fc693b2e39df65 David Howells 2021-07-01  33  		page->index =3D index;
fc693b2e39df65 David Howells 2021-07-01  34  		ret =3D xa_insert(xa, index+=
+, page, GFP_NOIO);
fc693b2e39df65 David Howells 2021-07-01  35  		if (ret < 0)
fc693b2e39df65 David Howells 2021-07-01  36  			break;
fc693b2e39df65 David Howells 2021-07-01  37  	}
fc693b2e39df65 David Howells 2021-07-01  38  =

fc693b2e39df65 David Howells 2021-07-01  39  	while ((page =3D list_first_e=
ntry_or_null(&list, struct page, lru))) {
fc693b2e39df65 David Howells 2021-07-01  40  		list_del(&page->lru);
fc693b2e39df65 David Howells 2021-07-01  41  		__free_page(page);
fc693b2e39df65 David Howells 2021-07-01  42  	}
fc693b2e39df65 David Howells 2021-07-01 @43  	return ret;
fc693b2e39df65 David Howells 2021-07-01  44  }
fc693b2e39df65 David Howells 2021-07-01  45  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2856086201257471960==--

