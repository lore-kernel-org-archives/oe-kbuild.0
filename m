Content-Type: multipart/mixed; boundary="===============5505079819496614188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 46/61] fs/netfs/buffered_flush.c:243 netfs_check_dirty_list() warn: ignoring unreachable code.
Date: Sun, 03 Jul 2022 18:12:41 +0800
Message-ID: <202207031839.j9M8ZUnm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5505079819496614188==
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
commit: 2dc27084e13c29183f0a6853b81e5fa2941948e3 [46/61] netfs: Generate a =
write request from ->writepages()
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20703/202207031839.j9M8ZUnm-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/buffered_flush.c:243 netfs_check_dirty_list() warn: ignoring unrea=
chable code.
fs/netfs/buffered_flush.c:687 netfs_find_writeback_start() error: uninitial=
ized symbol 'ret'.

vim +243 fs/netfs/buffered_flush.c

2dc27084e13c29 David Howells 2021-06-29  233  =

2dc27084e13c29 David Howells 2021-06-29  234  void netfs_check_dirty_list(c=
har c, const struct list_head *list,
2dc27084e13c29 David Howells 2021-06-29  235  			    const struct netfs_dir=
ty_region *star)
2dc27084e13c29 David Howells 2021-06-29  236  {
2dc27084e13c29 David Howells 2021-06-29  237  	const struct netfs_dirty_reg=
ion *r, *q;
2dc27084e13c29 David Howells 2021-06-29  238  	const struct list_head *p;
2dc27084e13c29 David Howells 2021-06-29  239  	int i =3D 0;
2dc27084e13c29 David Howells 2021-06-29  240  =

2dc27084e13c29 David Howells 2021-06-29  241  	return;
2dc27084e13c29 David Howells 2021-06-29  242  =

2dc27084e13c29 David Howells 2021-06-29 @243  	if (list->next =3D=3D list) {
2dc27084e13c29 David Howells 2021-06-29  244  		BUG_ON(list->prev !=3D list=
);
2dc27084e13c29 David Howells 2021-06-29  245  		return;
2dc27084e13c29 David Howells 2021-06-29  246  	}
2dc27084e13c29 David Howells 2021-06-29  247  	BUG_ON(list->prev =3D=3D lis=
t);
2dc27084e13c29 David Howells 2021-06-29  248  =

2dc27084e13c29 David Howells 2021-06-29  249  	list_for_each(p, list) {
2dc27084e13c29 David Howells 2021-06-29  250  		r =3D list_entry(p, struct =
netfs_dirty_region, dirty_link);
2dc27084e13c29 David Howells 2021-06-29  251  		if (p->prev->next !=3D p ||
2dc27084e13c29 David Howells 2021-06-29  252  		    p->next->prev !=3D p ||
2dc27084e13c29 David Howells 2021-06-29  253  		    r->last < r->first ||
2dc27084e13c29 David Howells 2021-06-29  254  		    r->from > r->to ||
2dc27084e13c29 David Howells 2021-06-29  255  		    r->from < r->first * PA=
GE_SIZE ||
2dc27084e13c29 David Howells 2021-06-29  256  		    r->to > (r->last + 1) *=
 PAGE_SIZE)
2dc27084e13c29 David Howells 2021-06-29  257  			goto failed;
2dc27084e13c29 David Howells 2021-06-29  258  		if (!list_is_first(p, list)=
) {
2dc27084e13c29 David Howells 2021-06-29  259  			q =3D list_prev_entry(r, d=
irty_link);
2dc27084e13c29 David Howells 2021-06-29  260  			if (q->last >=3D r->first)
2dc27084e13c29 David Howells 2021-06-29  261  				goto failed;
2dc27084e13c29 David Howells 2021-06-29  262  		}
2dc27084e13c29 David Howells 2021-06-29  263  	}
2dc27084e13c29 David Howells 2021-06-29  264  =

2dc27084e13c29 David Howells 2021-06-29  265  	return;
2dc27084e13c29 David Howells 2021-06-29  266  =

2dc27084e13c29 David Howells 2021-06-29  267  failed:
2dc27084e13c29 David Howells 2021-06-29  268  	kdebug("");
2dc27084e13c29 David Howells 2021-06-29  269  	list_for_each(p, list) {
2dc27084e13c29 David Howells 2021-06-29  270  		r =3D list_entry(p, struct =
netfs_dirty_region, dirty_link);
2dc27084e13c29 David Howells 2021-06-29  271  		kdebug("CHECK-%c[%x]%c D=3D=
%03x %04lx-%04lx %06llx-%06llx",
2dc27084e13c29 David Howells 2021-06-29  272  		       c, i++, r =3D=3D sta=
r ? '*' : ' ',
2dc27084e13c29 David Howells 2021-06-29  273  		       r->debug_id, r->firs=
t, r->last, r->from, r->to);
2dc27084e13c29 David Howells 2021-06-29  274  		BUG_ON(p->prev->next !=3D p=
);
2dc27084e13c29 David Howells 2021-06-29  275  		BUG_ON(p->next->prev !=3D p=
);
2dc27084e13c29 David Howells 2021-06-29  276  		BUG_ON(r->last < r->first);
2dc27084e13c29 David Howells 2021-06-29  277  		BUG_ON(r->from > r->to);
2dc27084e13c29 David Howells 2021-06-29  278  		BUG_ON(r->from < r->first *=
 PAGE_SIZE);
2dc27084e13c29 David Howells 2021-06-29  279  		BUG_ON(r->to > (r->last + 1=
) * PAGE_SIZE);
2dc27084e13c29 David Howells 2021-06-29  280  		if (!list_is_first(p, list)=
) {
2dc27084e13c29 David Howells 2021-06-29  281  			q =3D list_prev_entry(r, d=
irty_link);
2dc27084e13c29 David Howells 2021-06-29  282  			BUG_ON(q->last >=3D r->fir=
st);
2dc27084e13c29 David Howells 2021-06-29  283  		}
2dc27084e13c29 David Howells 2021-06-29  284  	}
2dc27084e13c29 David Howells 2021-06-29  285  }
2dc27084e13c29 David Howells 2021-06-29  286  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5505079819496614188==--

