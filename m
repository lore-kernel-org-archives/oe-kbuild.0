Content-Type: multipart/mixed; boundary="===============1021283870039483472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/4] staging: media: zoran: replace all pr_err() with zrdev_err()
Date: Tue, 26 Apr 2022 09:22:21 +0800
Message-ID: <202204260911.PpSNCMg4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1021283870039483472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220423051821.293133-1-ian@linux.cowan.aero>
References: <20220423051821.293133-1-ian@linux.cowan.aero>
TO: Ian Cowan <ian@linux.cowan.aero>
TO: clabbe(a)baylibre.com
CC: mchehab(a)kernel.org
CC: gregkh(a)linuxfoundation.org
CC: dan.carpenter(a)oracle.com
CC: mjpeg-users(a)lists.sourceforge.net
CC: linux-media(a)vger.kernel.org
CC: linux-staging(a)lists.linux.dev
CC: ian(a)linux.cowan.aero

Hi Ian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Cowan/staging-me=
dia-zoran-add-zrdev_dbg-macros/20220425-092814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
1efba7ef1d7da5944493728c5375fef5b2130de4
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-m021-20220425 (https://download.01.org/0day-ci/arch=
ive/20220426/202204260911.PpSNCMg4-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/media/zoran/videocodec.c:55 videocodec_attach() warn: varia=
ble dereferenced before check 'master' (see line 50)
drivers/staging/media/zoran/videocodec.c:124 videocodec_detach() warn: vari=
able dereferenced before check 'codec' (see line 120)
drivers/staging/media/zoran/videocodec.c:177 videocodec_register() warn: va=
riable dereferenced before check 'codec' (see line 175)
drivers/staging/media/zoran/videocodec.c:210 videocodec_unregister() warn: =
variable dereferenced before check 'codec' (see line 208)

vim +/master +55 drivers/staging/media/zoran/videocodec.c

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   46  =

5e195bbddabdd9 Corentin Labbe 2020-09-25   47  struct videocodec *videocode=
c_attach(struct videocodec_master *master)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   48  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   49  	struct codec_list *h =3D co=
declist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23  @50  	struct zoran *zr =3D videoc=
odec_master_to_zoran(master);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   51  	struct attached_list *a, *p=
tr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   52  	struct videocodec *codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   53  	int res;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   54  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  @55  	if (!master) {
a0a095d4ab6241 Ian Cowan      2022-04-23   56  		zrdev_err(zr, "%s: no data=
\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   57  		return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   58  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   59  =

a0a095d4ab6241 Ian Cowan      2022-04-23   60  	zrdev_dbg(zr, "%s: '%s', fl=
ags %lx, magic %lx\n", __func__,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   61  		  master->name, master->fl=
ags, master->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   62  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   63  	if (!h) {
a0a095d4ab6241 Ian Cowan      2022-04-23   64  		zrdev_err(zr, "%s: no devi=
ce available\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   65  		return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   66  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   67  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   68  	while (h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   69  		// attach only if the slav=
e has at least the flags
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   70  		// expected by the master
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   71  		if ((master->flags & h->co=
dec->flags) =3D=3D master->flags) {
5e195bbddabdd9 Corentin Labbe 2020-09-25   72  			dprintk(4, "%s: try '%s'\=
n", __func__, h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   73  =

5e195bbddabdd9 Corentin Labbe 2020-09-25   74  			codec =3D kmemdup(h->code=
c, sizeof(struct videocodec), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25   75  			if (!codec)
fe047de480ca23 Corentin Labbe 2021-12-14   76  				goto out_kfree;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   77  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   78  			res =3D strlen(codec->nam=
e);
5e195bbddabdd9 Corentin Labbe 2020-09-25   79  			snprintf(codec->name + re=
s, sizeof(codec->name) - res, "[%d]", h->attached);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   80  			codec->master_data =3D ma=
ster;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   81  			res =3D codec->setup(code=
c);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   82  			if (res =3D=3D 0) {
5e195bbddabdd9 Corentin Labbe 2020-09-25   83  				dprintk(3, "%s: '%s'\n",=
 __func__, codec->name);
5e195bbddabdd9 Corentin Labbe 2020-09-25   84  				ptr =3D kzalloc(sizeof(*=
ptr), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25   85  				if (!ptr)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   86  					goto out_kfree;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   87  				ptr->codec =3D codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   88  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25   89  				a =3D h->list;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   90  				if (!a) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   91  					h->list =3D ptr;
5e195bbddabdd9 Corentin Labbe 2020-09-25   92  					dprintk(4, "videocodec:=
 first element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   93  				} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   94  					while (a->next)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   95  						a =3D a->next;	// find=
 end
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   96  					a->next =3D ptr;
5e195bbddabdd9 Corentin Labbe 2020-09-25   97  					dprintk(4, "videocodec:=
 in after '%s'\n", h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   98  				}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25   99  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  100  				h->attached +=3D 1;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  101  				return codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  102  			} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  103  				kfree(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  104  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  105  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  106  		h =3D h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  107  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  108  =

a0a095d4ab6241 Ian Cowan      2022-04-23  109  	zrdev_err(zr, "%s: no codec=
 found!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  110  	return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  111  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  112   out_kfree:
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  113  	kfree(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  114  	return NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  115  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  116  =

5e195bbddabdd9 Corentin Labbe 2020-09-25  117  int videocodec_detach(struct=
 videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  118  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  119  	struct codec_list *h =3D co=
declist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @120  	struct zoran *zr =3D videoc=
odec_to_zoran(codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  121  	struct attached_list *a, *p=
rev;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  122  	int res;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  123  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @124  	if (!codec) {
a0a095d4ab6241 Ian Cowan      2022-04-23  125  		zrdev_err(zr, "%s: no data=
\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  126  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  127  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  128  =

5e195bbddabdd9 Corentin Labbe 2020-09-25  129  	dprintk(2, "%s: '%s', type:=
 %x, flags %lx, magic %lx\n", __func__,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  130  		codec->name, codec->type, =
codec->flags, codec->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  131  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  132  	if (!h) {
a0a095d4ab6241 Ian Cowan      2022-04-23  133  		zrdev_err(zr, "%s: no devi=
ce left...\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  134  		return -ENXIO;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  135  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  136  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  137  	while (h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  138  		a =3D h->list;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  139  		prev =3D NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  140  		while (a) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  141  			if (codec =3D=3D a->codec=
) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  142  				res =3D a->codec->unset(=
a->codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  143  				if (res >=3D 0) {
5e195bbddabdd9 Corentin Labbe 2020-09-25  144  					dprintk(3, "%s: '%s'\n"=
, __func__, a->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  145  					a->codec->master_data =
=3D NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  146  				} else {
a0a095d4ab6241 Ian Cowan      2022-04-23  147  					zrdev_err(zr, "%s: '%s'=
\n", __func__, a->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  148  					a->codec->master_data =
=3D NULL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  149  				}
5e195bbddabdd9 Corentin Labbe 2020-09-25  150  				if (!prev) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  151  					h->list =3D a->next;
5e195bbddabdd9 Corentin Labbe 2020-09-25  152  					dprintk(4, "videocodec:=
 delete first\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  153  				} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  154  					prev->next =3D a->next;
5e195bbddabdd9 Corentin Labbe 2020-09-25  155  					dprintk(4, "videocodec:=
 delete middle\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  156  				}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  157  				kfree(a->codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  158  				kfree(a);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  159  				h->attached -=3D 1;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  160  				return 0;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  161  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  162  			prev =3D a;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  163  			a =3D a->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  164  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  165  		h =3D h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  166  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  167  =

a0a095d4ab6241 Ian Cowan      2022-04-23  168  	zrdev_err(zr, "%s: given co=
dec not found!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  169  	return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  170  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  171  =

5e195bbddabdd9 Corentin Labbe 2020-09-25  172  int videocodec_register(cons=
t struct videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  173  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  174  	struct codec_list *ptr, *h =
=3D codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @175  	struct zoran *zr =3D videoc=
odec_to_zoran((struct videocodec *)codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  176  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @177  	if (!codec) {
a0a095d4ab6241 Ian Cowan      2022-04-23  178  		zrdev_err(zr, "%s: no data=
!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  179  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  180  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  181  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  182  	dprintk(2,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  183  		"videocodec: register '%s'=
, type: %x, flags %lx, magic %lx\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  184  		codec->name, codec->type, =
codec->flags, codec->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  185  =

5e195bbddabdd9 Corentin Labbe 2020-09-25  186  	ptr =3D kzalloc(sizeof(*ptr=
), GFP_KERNEL);
5e195bbddabdd9 Corentin Labbe 2020-09-25  187  	if (!ptr)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  188  		return -ENOMEM;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  189  	ptr->codec =3D codec;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  190  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  191  	if (!h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  192  		codeclist_top =3D ptr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  193  		dprintk(4, "videocodec: ho=
oked in as first element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  194  	} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  195  		while (h->next)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  196  			h =3D h->next;	// find th=
e end
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  197  		h->next =3D ptr;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  198  		dprintk(4, "videocodec: ho=
oked in after '%s'\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  199  			h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  200  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  201  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  202  	return 0;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  203  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  204  =

5e195bbddabdd9 Corentin Labbe 2020-09-25  205  int videocodec_unregister(co=
nst struct videocodec *codec)
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  206  {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  207  	struct codec_list *prev =3D=
 NULL, *h =3D codeclist_top;
a0a095d4ab6241 Ian Cowan      2022-04-23 @208  	struct zoran *zr =3D videoc=
odec_to_zoran((struct videocodec *)codec);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  209  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25 @210  	if (!codec) {
a0a095d4ab6241 Ian Cowan      2022-04-23  211  		zrdev_err(zr, "%s: no data=
!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  212  		return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  213  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  214  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  215  	dprintk(2,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  216  		"videocodec: unregister '%=
s', type: %x, flags %lx, magic %lx\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  217  		codec->name, codec->type, =
codec->flags, codec->magic);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  218  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  219  	if (!h) {
a0a095d4ab6241 Ian Cowan      2022-04-23  220  		zrdev_err(zr, "%s: no devi=
ce left...\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  221  		return -ENXIO;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  222  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  223  =

61c3b19f7b9eb7 Corentin Labbe 2020-09-25  224  	while (h) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  225  		if (codec =3D=3D h->codec)=
 {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  226  			if (h->attached) {
a0a095d4ab6241 Ian Cowan      2022-04-23  227  				zrdev_err(zr, "videocode=
c: '%s' is used\n", h->codec->name);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  228  				return -EBUSY;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  229  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  230  			dprintk(3, "videocodec: u=
nregister '%s' is ok.\n",
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  231  				h->codec->name);
5e195bbddabdd9 Corentin Labbe 2020-09-25  232  			if (!prev) {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  233  				codeclist_top =3D h->nex=
t;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  234  				dprintk(4,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  235  					"videocodec: delete fir=
st element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  236  			} else {
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  237  				prev->next =3D h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  238  				dprintk(4,
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  239  					"videocodec: delete mid=
dle element\n");
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  240  			}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  241  			kfree(h);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  242  			return 0;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  243  		}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  244  		prev =3D h;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  245  		h =3D h->next;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  246  	}
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  247  =

a0a095d4ab6241 Ian Cowan      2022-04-23  248  	zrdev_err(zr, "%s: given co=
dec not found!\n", __func__);
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  249  	return -EINVAL;
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  250  }
61c3b19f7b9eb7 Corentin Labbe 2020-09-25  251  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1021283870039483472==--

