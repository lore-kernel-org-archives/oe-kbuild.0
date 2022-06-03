Content-Type: multipart/mixed; boundary="===============0661994532981932734=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 39/59] fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Date: Fri, 03 Jun 2022 14:36:22 +0800
Message-ID: <202206031407.dAVDFmTL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0661994532981932734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
linked-list
head:   22ecc2fcdab4616e624408911ec1d54644e82030
commit: b5b1a16a9c1a2ff8c62ef0c952b5672b3c78800c [39/59] netfs: Perform con=
tent encryption
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20603/202206031407.dAVDFmTL-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.

vim +/ret +43 fs/netfs/crypto.c

b5b1a16a9c1a2ff David Howells 2021-07-01  14  =

b5b1a16a9c1a2ff David Howells 2021-07-01  15  /*
b5b1a16a9c1a2ff David Howells 2021-07-01  16   * Allocate a bunch of pages =
and add them into the xarray buffer starting at
b5b1a16a9c1a2ff David Howells 2021-07-01  17   * the given index.
b5b1a16a9c1a2ff David Howells 2021-07-01  18   */
b5b1a16a9c1a2ff David Howells 2021-07-01  19  int netfs_alloc_buffer(struct=
 xarray *xa, pgoff_t index, unsigned int nr_pages)
b5b1a16a9c1a2ff David Howells 2021-07-01  20  {
b5b1a16a9c1a2ff David Howells 2021-07-01  21  	struct page *page;
b5b1a16a9c1a2ff David Howells 2021-07-01  22  	unsigned int n;
b5b1a16a9c1a2ff David Howells 2021-07-01  23  	int ret;
b5b1a16a9c1a2ff David Howells 2021-07-01  24  	LIST_HEAD(list);
b5b1a16a9c1a2ff David Howells 2021-07-01  25  =

b5b1a16a9c1a2ff David Howells 2021-07-01  26  	n =3D alloc_pages_bulk_list(=
GFP_NOIO, nr_pages, &list);
b5b1a16a9c1a2ff David Howells 2021-07-01  27  	if (n < nr_pages) {
b5b1a16a9c1a2ff David Howells 2021-07-01  28  		ret =3D -ENOMEM;
b5b1a16a9c1a2ff David Howells 2021-07-01  29  	}
b5b1a16a9c1a2ff David Howells 2021-07-01  30  =

b5b1a16a9c1a2ff David Howells 2021-07-01  31  	while ((page =3D list_first_=
entry_or_null(&list, struct page, lru))) {
b5b1a16a9c1a2ff David Howells 2021-07-01  32  		list_del(&page->lru);
b5b1a16a9c1a2ff David Howells 2021-07-01  33  		page->index =3D index;
b5b1a16a9c1a2ff David Howells 2021-07-01  34  		ret =3D xa_insert(xa, index=
++, page, GFP_NOIO);
b5b1a16a9c1a2ff David Howells 2021-07-01  35  		if (ret < 0)
b5b1a16a9c1a2ff David Howells 2021-07-01  36  			break;
b5b1a16a9c1a2ff David Howells 2021-07-01  37  	}
b5b1a16a9c1a2ff David Howells 2021-07-01  38  =

b5b1a16a9c1a2ff David Howells 2021-07-01  39  	while ((page =3D list_first_=
entry_or_null(&list, struct page, lru))) {
b5b1a16a9c1a2ff David Howells 2021-07-01  40  		list_del(&page->lru);
b5b1a16a9c1a2ff David Howells 2021-07-01  41  		__free_page(page);
b5b1a16a9c1a2ff David Howells 2021-07-01  42  	}
b5b1a16a9c1a2ff David Howells 2021-07-01 @43  	return ret;
b5b1a16a9c1a2ff David Howells 2021-07-01  44  }
b5b1a16a9c1a2ff David Howells 2021-07-01  45  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0661994532981932734==--

