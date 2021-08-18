Content-Type: multipart/mixed; boundary="===============8611086374983427191=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4326/8804] block/partitions/cmdline.c:100:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Wed, 18 Aug 2021 21:02:31 +0800
Message-ID: <202108182123.oXhvsfAC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8611086374983427191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   f26c3abc432a2026ba9ee7767061a1f88aead6ec
commit: 2164877c7f373e14e55fca20b7c4a9c436fe4462 [4326/8804] block: remove =
cmdline-parser.c
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/partitions/cmdline.c:100:3: warning: Assignment of function parame=
ter has no effect outside the function. Did you forget dereferencing it? [u=
selessAssignmentPtrArg]
     partdef +=3D 2;
     ^

vim +100 block/partitions/cmdline.c

2164877c7f373e Christoph Hellwig 2021-07-28   41  =

2164877c7f373e Christoph Hellwig 2021-07-28   42  static int parse_subpart(=
struct cmdline_subpart **subpart, char *partdef)
2164877c7f373e Christoph Hellwig 2021-07-28   43  {
2164877c7f373e Christoph Hellwig 2021-07-28   44  	int ret =3D 0;
2164877c7f373e Christoph Hellwig 2021-07-28   45  	struct cmdline_subpart *=
new_subpart;
2164877c7f373e Christoph Hellwig 2021-07-28   46  =

2164877c7f373e Christoph Hellwig 2021-07-28   47  	*subpart =3D NULL;
2164877c7f373e Christoph Hellwig 2021-07-28   48  =

2164877c7f373e Christoph Hellwig 2021-07-28   49  	new_subpart =3D kzalloc(=
sizeof(struct cmdline_subpart), GFP_KERNEL);
2164877c7f373e Christoph Hellwig 2021-07-28   50  	if (!new_subpart)
2164877c7f373e Christoph Hellwig 2021-07-28   51  		return -ENOMEM;
2164877c7f373e Christoph Hellwig 2021-07-28   52  =

2164877c7f373e Christoph Hellwig 2021-07-28   53  	if (*partdef =3D=3D '-')=
 {
2164877c7f373e Christoph Hellwig 2021-07-28   54  		new_subpart->size =3D (=
sector_t)(~0ULL);
2164877c7f373e Christoph Hellwig 2021-07-28   55  		partdef++;
2164877c7f373e Christoph Hellwig 2021-07-28   56  	} else {
2164877c7f373e Christoph Hellwig 2021-07-28   57  		new_subpart->size =3D (=
sector_t)memparse(partdef, &partdef);
2164877c7f373e Christoph Hellwig 2021-07-28   58  		if (new_subpart->size <=
 (sector_t)PAGE_SIZE) {
2164877c7f373e Christoph Hellwig 2021-07-28   59  			pr_warn("cmdline parti=
tion size is invalid.");
2164877c7f373e Christoph Hellwig 2021-07-28   60  			ret =3D -EINVAL;
2164877c7f373e Christoph Hellwig 2021-07-28   61  			goto fail;
2164877c7f373e Christoph Hellwig 2021-07-28   62  		}
2164877c7f373e Christoph Hellwig 2021-07-28   63  	}
2164877c7f373e Christoph Hellwig 2021-07-28   64  =

2164877c7f373e Christoph Hellwig 2021-07-28   65  	if (*partdef =3D=3D '@')=
 {
2164877c7f373e Christoph Hellwig 2021-07-28   66  		partdef++;
2164877c7f373e Christoph Hellwig 2021-07-28   67  		new_subpart->from =3D (=
sector_t)memparse(partdef, &partdef);
2164877c7f373e Christoph Hellwig 2021-07-28   68  	} else {
2164877c7f373e Christoph Hellwig 2021-07-28   69  		new_subpart->from =3D (=
sector_t)(~0ULL);
2164877c7f373e Christoph Hellwig 2021-07-28   70  	}
2164877c7f373e Christoph Hellwig 2021-07-28   71  =

2164877c7f373e Christoph Hellwig 2021-07-28   72  	if (*partdef =3D=3D '(')=
 {
2164877c7f373e Christoph Hellwig 2021-07-28   73  		int length;
2164877c7f373e Christoph Hellwig 2021-07-28   74  		char *next =3D strchr(+=
+partdef, ')');
2164877c7f373e Christoph Hellwig 2021-07-28   75  =

2164877c7f373e Christoph Hellwig 2021-07-28   76  		if (!next) {
2164877c7f373e Christoph Hellwig 2021-07-28   77  			pr_warn("cmdline parti=
tion format is invalid.");
2164877c7f373e Christoph Hellwig 2021-07-28   78  			ret =3D -EINVAL;
2164877c7f373e Christoph Hellwig 2021-07-28   79  			goto fail;
2164877c7f373e Christoph Hellwig 2021-07-28   80  		}
2164877c7f373e Christoph Hellwig 2021-07-28   81  =

2164877c7f373e Christoph Hellwig 2021-07-28   82  		length =3D min_t(int, n=
ext - partdef,
2164877c7f373e Christoph Hellwig 2021-07-28   83  			       sizeof(new_subp=
art->name) - 1);
2164877c7f373e Christoph Hellwig 2021-07-28   84  		strncpy(new_subpart->na=
me, partdef, length);
2164877c7f373e Christoph Hellwig 2021-07-28   85  		new_subpart->name[lengt=
h] =3D '\0';
2164877c7f373e Christoph Hellwig 2021-07-28   86  =

2164877c7f373e Christoph Hellwig 2021-07-28   87  		partdef =3D ++next;
2164877c7f373e Christoph Hellwig 2021-07-28   88  	} else
2164877c7f373e Christoph Hellwig 2021-07-28   89  		new_subpart->name[0] =
=3D '\0';
2164877c7f373e Christoph Hellwig 2021-07-28   90  =

2164877c7f373e Christoph Hellwig 2021-07-28   91  	new_subpart->flags =3D 0;
2164877c7f373e Christoph Hellwig 2021-07-28   92  =

2164877c7f373e Christoph Hellwig 2021-07-28   93  	if (!strncmp(partdef, "r=
o", 2)) {
2164877c7f373e Christoph Hellwig 2021-07-28   94  		new_subpart->flags |=3D=
 PF_RDONLY;
2164877c7f373e Christoph Hellwig 2021-07-28   95  		partdef +=3D 2;
2164877c7f373e Christoph Hellwig 2021-07-28   96  	}
2164877c7f373e Christoph Hellwig 2021-07-28   97  =

2164877c7f373e Christoph Hellwig 2021-07-28   98  	if (!strncmp(partdef, "l=
k", 2)) {
2164877c7f373e Christoph Hellwig 2021-07-28   99  		new_subpart->flags |=3D=
 PF_POWERUP_LOCK;
2164877c7f373e Christoph Hellwig 2021-07-28 @100  		partdef +=3D 2;
2164877c7f373e Christoph Hellwig 2021-07-28  101  	}
2164877c7f373e Christoph Hellwig 2021-07-28  102  =

2164877c7f373e Christoph Hellwig 2021-07-28  103  	*subpart =3D new_subpart;
2164877c7f373e Christoph Hellwig 2021-07-28  104  	return 0;
2164877c7f373e Christoph Hellwig 2021-07-28  105  fail:
2164877c7f373e Christoph Hellwig 2021-07-28  106  	kfree(new_subpart);
2164877c7f373e Christoph Hellwig 2021-07-28  107  	return ret;
2164877c7f373e Christoph Hellwig 2021-07-28  108  }
2164877c7f373e Christoph Hellwig 2021-07-28  109  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8611086374983427191==--

