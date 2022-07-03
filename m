Content-Type: multipart/mixed; boundary="===============8160838787627067339=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 34/61] fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Date: Sun, 03 Jul 2022 17:42:15 +0800
Message-ID: <202207031716.OOwU4RF7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8160838787627067339==
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
head:   ce4670495468b797b0c5927fcb661bc0da48b9ab
commit: e82aac757ed8d59aa6a2dc8d7c9cf964eb3837dd [34/61] netfs: Perform con=
tent encryption
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207031716.OOwU4RF7-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/crypto.c:43 netfs_alloc_buffer() error: uninitialized symbol 'ret'.

vim +/ret +43 fs/netfs/crypto.c

e82aac757ed8d5 David Howells 2021-07-01  14  =

e82aac757ed8d5 David Howells 2021-07-01  15  /*
e82aac757ed8d5 David Howells 2021-07-01  16   * Allocate a bunch of pages a=
nd add them into the xarray buffer starting at
e82aac757ed8d5 David Howells 2021-07-01  17   * the given index.
e82aac757ed8d5 David Howells 2021-07-01  18   */
e82aac757ed8d5 David Howells 2021-07-01  19  int netfs_alloc_buffer(struct =
xarray *xa, pgoff_t index, unsigned int nr_pages)
e82aac757ed8d5 David Howells 2021-07-01  20  {
e82aac757ed8d5 David Howells 2021-07-01  21  	struct page *page;
e82aac757ed8d5 David Howells 2021-07-01  22  	unsigned int n;
e82aac757ed8d5 David Howells 2021-07-01  23  	int ret;
e82aac757ed8d5 David Howells 2021-07-01  24  	LIST_HEAD(list);
e82aac757ed8d5 David Howells 2021-07-01  25  =

e82aac757ed8d5 David Howells 2021-07-01  26  	n =3D alloc_pages_bulk_list(G=
FP_NOIO, nr_pages, &list);
e82aac757ed8d5 David Howells 2021-07-01  27  	if (n < nr_pages) {
e82aac757ed8d5 David Howells 2021-07-01  28  		ret =3D -ENOMEM;
e82aac757ed8d5 David Howells 2021-07-01  29  	}
e82aac757ed8d5 David Howells 2021-07-01  30  =

e82aac757ed8d5 David Howells 2021-07-01  31  	while ((page =3D list_first_e=
ntry_or_null(&list, struct page, lru))) {
e82aac757ed8d5 David Howells 2021-07-01  32  		list_del(&page->lru);
e82aac757ed8d5 David Howells 2021-07-01  33  		page->index =3D index;
e82aac757ed8d5 David Howells 2021-07-01  34  		ret =3D xa_insert(xa, index+=
+, page, GFP_NOIO);
e82aac757ed8d5 David Howells 2021-07-01  35  		if (ret < 0)
e82aac757ed8d5 David Howells 2021-07-01  36  			break;
e82aac757ed8d5 David Howells 2021-07-01  37  	}
e82aac757ed8d5 David Howells 2021-07-01  38  =

e82aac757ed8d5 David Howells 2021-07-01  39  	while ((page =3D list_first_e=
ntry_or_null(&list, struct page, lru))) {
e82aac757ed8d5 David Howells 2021-07-01  40  		list_del(&page->lru);
e82aac757ed8d5 David Howells 2021-07-01  41  		__free_page(page);
e82aac757ed8d5 David Howells 2021-07-01  42  	}
e82aac757ed8d5 David Howells 2021-07-01 @43  	return ret;
e82aac757ed8d5 David Howells 2021-07-01  44  }
e82aac757ed8d5 David Howells 2021-07-01  45  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8160838787627067339==--

