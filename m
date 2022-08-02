Content-Type: multipart/mixed; boundary="===============1029458379092634965=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kees:for-next/kspp 6/11] security/loadpin/loadpin.c:264:15: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 02 Aug 2022 15:20:31 +0800
Message-ID: <202208021544.E2q3RF5s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1029458379092634965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: security/=
loadpin/loadpin.c:264:15: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Matthias Kaehlcke <mka@chromium.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-=
next/kspp
head:   27603a606fda0806d7c08914bc976931aa42020e
commit: 3f805f8cc23ba35679dd01446929292911c2b469 [6/11] LoadPin: Enable loa=
ding from trusted dm-verity devices
:::::: branch date: 4 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c002-20220731 (https://download.01.org/0day-ci/archi=
ve/20220802/202208021544.E2q3RF5s-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/co=
mmit/?id=3D3f805f8cc23ba35679dd01446929292911c2b469
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git=
/kees/linux.git
        git fetch --no-tags kees for-next/kspp
        git checkout 3f805f8cc23ba35679dd01446929292911c2b469
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   security/loadpin/loadpin.c: In function 'read_trusted_verity_root_digest=
s':
>> security/loadpin/loadpin.c:264:15: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     264 |         void *data;
         |               ^~~~
     'read_trusted_verity_root_digests': event 1
       |
       |  264 |         void *data;
       |      |               ^~~~
       |      |               |
       |      |               (1) use of uninitialized value '<unknown>' he=
re
       |
   security/loadpin/loadpin.c:266:15: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     266 |         char *p, *d;
         |               ^
     'read_trusted_verity_root_digests': event 1
       |
       |  266 |         char *p, *d;
       |      |               ^
       |      |               |
       |      |               (1) use of uninitialized value '<unknown>' he=
re
       |
   security/loadpin/loadpin.c: In function 'dm_verity_ioctl':
   security/loadpin/loadpin.c:358:22: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     358 |         unsigned int fd;
         |                      ^~
     'dm_verity_ioctl': event 1
       |
       |  358 |         unsigned int fd;
       |      |                      ^~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +264 security/loadpin/loadpin.c

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  260  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  261  static int read_trusted_v=
erity_root_digests(unsigned int fd)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  262  {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  263  	struct fd f;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27 @264  	void *data;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  265  	int rc;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  266  	char *p, *d;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  267  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  268  	if (deny_reading_verity_=
digests)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  269  		return -EPERM;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  270  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  271  	/* The list of trusted r=
oot digests can only be set up once */
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  272  	if (!list_empty(&dm_veri=
ty_loadpin_trusted_root_digests))
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  273  		return -EPERM;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  274  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  275  	f =3D fdget(fd);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  276  	if (!f.file)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  277  		return -EINVAL;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  278  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  279  	data =3D kzalloc(SZ_4K, =
GFP_KERNEL);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  280  	if (!data) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  281  		rc =3D -ENOMEM;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  282  		goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  283  	}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  284  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  285  	rc =3D kernel_read_file(=
f.file, 0, (void **)&data, SZ_4K - 1, NULL, READING_POLICY);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  286  	if (rc < 0)
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  287  		goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  288  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  289  	p =3D data;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  290  	p[rc] =3D '\0';
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  291  	p =3D strim(p);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  292  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  293  	p =3D strim(data);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  294  	while ((d =3D strsep(&p,=
 "\n")) !=3D NULL) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  295  		int len =3D strlen(d);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  296  		struct dm_verity_loadpi=
n_trusted_root_digest *trd;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  297  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  298  		if (len % 2) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  299  			rc =3D -EPROTO;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  300  			goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  301  		}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  302  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  303  		len /=3D 2;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  304  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  305  		trd =3D kzalloc(struct_=
size(trd, data, len), GFP_KERNEL);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  306  		if (!trd) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  307  			rc =3D -ENOMEM;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  308  			goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  309  		}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  310  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  311  		if (hex2bin(trd->data, =
d, len)) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  312  			kfree(trd);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  313  			rc =3D -EPROTO;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  314  			goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  315  		}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  316  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  317  		trd->len =3D len;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  318  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  319  		list_add_tail(&trd->nod=
e, &dm_verity_loadpin_trusted_root_digests);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  320  	}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  321  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  322  	if (list_empty(&dm_verit=
y_loadpin_trusted_root_digests)) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  323  		rc =3D -EPROTO;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  324  		goto err;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  325  	}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  326  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  327  	kfree(data);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  328  	fdput(f);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  329  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  330  	return 0;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  331  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  332  err:
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  333  	kfree(data);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  334  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  335  	/* any failure in loadin=
g/parsing invalidates the entire list */
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  336  	{
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  337  		struct dm_verity_loadpi=
n_trusted_root_digest *trd, *tmp;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  338  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  339  		list_for_each_entry_saf=
e(trd, tmp, &dm_verity_loadpin_trusted_root_digests, node) {
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  340  			list_del(&trd->node);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  341  			kfree(trd);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  342  		}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  343  	}
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  344  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  345  	/* disallow further atte=
mpts after reading a corrupt/invalid file */
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  346  	deny_reading_verity_dige=
sts =3D true;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  347  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  348  	fdput(f);
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  349  =

3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  350  	return rc;
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  351  }
3f805f8cc23ba3 Matthias Kaehlcke 2022-06-27  352  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1029458379092634965==--

