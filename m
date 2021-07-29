Content-Type: multipart/mixed; boundary="===============0472459938204966715=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3890/4407] block/partitions/cmdline.c:100:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing it? [uselessAssignmentPtrArg]
Date: Fri, 30 Jul 2021 04:46:38 +0800
Message-ID: <202107300430.oy172Av5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0472459938204966715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4ccc9e2db7ac33f450a1ff6ce158a71e5a81ded9
commit: cff960c313fa7b4b29b2f9b1ad08770dc0034a1b [3890/4407] block: remove =
cmdline-parser.c
:::::: branch date: 5 hours ago
:::::: commit date: 31 hours ago
compiler: nds32le-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> block/partitions/cmdline.c:100:3: warning: Assignment of function parame=
ter has no effect outside the function. Did you forget dereferencing it? [u=
selessAssignmentPtrArg]
     partdef +=3D 2;
     ^

vim +100 block/partitions/cmdline.c

cff960c313fa7b4 Christoph Hellwig 2021-07-28   41  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   42  static int parse_subpart=
(struct cmdline_subpart **subpart, char *partdef)
cff960c313fa7b4 Christoph Hellwig 2021-07-28   43  {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   44  	int ret =3D 0;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   45  	struct cmdline_subpart =
*new_subpart;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   46  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   47  	*subpart =3D NULL;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   48  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   49  	new_subpart =3D kzalloc=
(sizeof(struct cmdline_subpart), GFP_KERNEL);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   50  	if (!new_subpart)
cff960c313fa7b4 Christoph Hellwig 2021-07-28   51  		return -ENOMEM;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   52  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   53  	if (*partdef =3D=3D '-'=
) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   54  		new_subpart->size =3D =
(sector_t)(~0ULL);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   55  		partdef++;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   56  	} else {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   57  		new_subpart->size =3D =
(sector_t)memparse(partdef, &partdef);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   58  		if (new_subpart->size =
< (sector_t)PAGE_SIZE) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   59  			pr_warn("cmdline part=
ition size is invalid.");
cff960c313fa7b4 Christoph Hellwig 2021-07-28   60  			ret =3D -EINVAL;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   61  			goto fail;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   62  		}
cff960c313fa7b4 Christoph Hellwig 2021-07-28   63  	}
cff960c313fa7b4 Christoph Hellwig 2021-07-28   64  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   65  	if (*partdef =3D=3D '@'=
) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   66  		partdef++;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   67  		new_subpart->from =3D =
(sector_t)memparse(partdef, &partdef);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   68  	} else {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   69  		new_subpart->from =3D =
(sector_t)(~0ULL);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   70  	}
cff960c313fa7b4 Christoph Hellwig 2021-07-28   71  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   72  	if (*partdef =3D=3D '('=
) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   73  		int length;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   74  		char *next =3D strchr(=
++partdef, ')');
cff960c313fa7b4 Christoph Hellwig 2021-07-28   75  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   76  		if (!next) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   77  			pr_warn("cmdline part=
ition format is invalid.");
cff960c313fa7b4 Christoph Hellwig 2021-07-28   78  			ret =3D -EINVAL;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   79  			goto fail;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   80  		}
cff960c313fa7b4 Christoph Hellwig 2021-07-28   81  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   82  		length =3D min_t(int, =
next - partdef,
cff960c313fa7b4 Christoph Hellwig 2021-07-28   83  			       sizeof(new_sub=
part->name) - 1);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   84  		strncpy(new_subpart->n=
ame, partdef, length);
cff960c313fa7b4 Christoph Hellwig 2021-07-28   85  		new_subpart->name[leng=
th] =3D '\0';
cff960c313fa7b4 Christoph Hellwig 2021-07-28   86  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   87  		partdef =3D ++next;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   88  	} else
cff960c313fa7b4 Christoph Hellwig 2021-07-28   89  		new_subpart->name[0] =
=3D '\0';
cff960c313fa7b4 Christoph Hellwig 2021-07-28   90  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   91  	new_subpart->flags =3D =
0;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   92  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   93  	if (!strncmp(partdef, "=
ro", 2)) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   94  		new_subpart->flags |=
=3D PF_RDONLY;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   95  		partdef +=3D 2;
cff960c313fa7b4 Christoph Hellwig 2021-07-28   96  	}
cff960c313fa7b4 Christoph Hellwig 2021-07-28   97  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28   98  	if (!strncmp(partdef, "=
lk", 2)) {
cff960c313fa7b4 Christoph Hellwig 2021-07-28   99  		new_subpart->flags |=
=3D PF_POWERUP_LOCK;
cff960c313fa7b4 Christoph Hellwig 2021-07-28 @100  		partdef +=3D 2;
cff960c313fa7b4 Christoph Hellwig 2021-07-28  101  	}
cff960c313fa7b4 Christoph Hellwig 2021-07-28  102  =

cff960c313fa7b4 Christoph Hellwig 2021-07-28  103  	*subpart =3D new_subpar=
t;
cff960c313fa7b4 Christoph Hellwig 2021-07-28  104  	return 0;
cff960c313fa7b4 Christoph Hellwig 2021-07-28  105  fail:
cff960c313fa7b4 Christoph Hellwig 2021-07-28  106  	kfree(new_subpart);
cff960c313fa7b4 Christoph Hellwig 2021-07-28  107  	return ret;
cff960c313fa7b4 Christoph Hellwig 2021-07-28  108  }
cff960c313fa7b4 Christoph Hellwig 2021-07-28  109  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0472459938204966715==--

