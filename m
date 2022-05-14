Content-Type: multipart/mixed; boundary="===============7858741641831665735=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 1/4] kernfs: make ->attr.open RCU protected.
Date: Sat, 14 May 2022 17:30:45 +0800
Message-ID: <202205141708.2SQYmW1K-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7858741641831665735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220511095157.478522-2-imran.f.khan@oracle.com>
References: <20220511095157.478522-2-imran.f.khan@oracle.com>
TO: Imran Khan <imran.f.khan@oracle.com>

Hi Imran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 3bf222d317a20170ee17f082626c1e0f83537e13]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/kernfs-ma=
ke-attr-open-RCU-protected/20220511-175730
base:   3bf222d317a20170ee17f082626c1e0f83537e13
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
514/202205141708.2SQYmW1K-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/kernfs/file.c:282 kernfs_file_read_iter() warn: inconsistent returns '&o=
f->mutex'.

Old smatch warnings:
fs/kernfs/file.c:255 kernfs_file_read_iter() warn: possible memory leak of =
'buf'
fs/kernfs/file.c:282 kernfs_file_read_iter() warn: possible memory leak of =
'buf'

vim +282 fs/kernfs/file.c

414985ae23c031 Tejun Heo         2013-11-28  219  =

414985ae23c031 Tejun Heo         2013-11-28  220  /*
414985ae23c031 Tejun Heo         2013-11-28  221   * As reading a bin file =
can have side-effects, the exact offset and bytes
414985ae23c031 Tejun Heo         2013-11-28  222   * specified in read(2) c=
all should be passed to the read callback making
414985ae23c031 Tejun Heo         2013-11-28  223   * it difficult to use se=
q_file.  Implement simplistic custom buffering for
414985ae23c031 Tejun Heo         2013-11-28  224   * bin files.
414985ae23c031 Tejun Heo         2013-11-28  225   */
4eaad21a6ac986 Christoph Hellwig 2021-01-20  226  static ssize_t kernfs_fil=
e_read_iter(struct kiocb *iocb, struct iov_iter *iter)
414985ae23c031 Tejun Heo         2013-11-28  227  {
4eaad21a6ac986 Christoph Hellwig 2021-01-20  228  	struct kernfs_open_file =
*of =3D kernfs_of(iocb->ki_filp);
4eaad21a6ac986 Christoph Hellwig 2021-01-20  229  	ssize_t len =3D min_t(si=
ze_t, iov_iter_count(iter), PAGE_SIZE);
414985ae23c031 Tejun Heo         2013-11-28  230  	const struct kernfs_ops =
*ops;
302de586c74f7b Imran Khan        2022-05-11  231  	struct kernfs_open_node =
*on;
414985ae23c031 Tejun Heo         2013-11-28  232  	char *buf;
414985ae23c031 Tejun Heo         2013-11-28  233  =

4ef67a8c95f32e NeilBrown         2014-10-14  234  	buf =3D of->prealloc_buf;
e4234a1fc343ca Chris Wilson      2016-03-31  235  	if (buf)
e4234a1fc343ca Chris Wilson      2016-03-31  236  		mutex_lock(&of->preallo=
c_mutex);
e4234a1fc343ca Chris Wilson      2016-03-31  237  	else
414985ae23c031 Tejun Heo         2013-11-28  238  		buf =3D kmalloc(len, GF=
P_KERNEL);
414985ae23c031 Tejun Heo         2013-11-28  239  	if (!buf)
414985ae23c031 Tejun Heo         2013-11-28  240  		return -ENOMEM;
414985ae23c031 Tejun Heo         2013-11-28  241  =

414985ae23c031 Tejun Heo         2013-11-28  242  	/*
4ef67a8c95f32e NeilBrown         2014-10-14  243  	 * @of->mutex nests outs=
ide active ref and is used both to ensure that
e4234a1fc343ca Chris Wilson      2016-03-31  244  	 * the ops aren't called=
 concurrently for the same open file.
414985ae23c031 Tejun Heo         2013-11-28  245  	 */
414985ae23c031 Tejun Heo         2013-11-28  246  	mutex_lock(&of->mutex);
c637b8acbe079e Tejun Heo         2013-12-11  247  	if (!kernfs_get_active(o=
f->kn)) {
414985ae23c031 Tejun Heo         2013-11-28  248  		len =3D -ENODEV;
414985ae23c031 Tejun Heo         2013-11-28  249  		mutex_unlock(&of->mutex=
);
414985ae23c031 Tejun Heo         2013-11-28  250  		goto out_free;
414985ae23c031 Tejun Heo         2013-11-28  251  	}
414985ae23c031 Tejun Heo         2013-11-28  252  =

302de586c74f7b Imran Khan        2022-05-11  253  	on =3D kernfs_deref_on_r=
aw(of, of->kn);
302de586c74f7b Imran Khan        2022-05-11  254  	if (!on)
302de586c74f7b Imran Khan        2022-05-11  255  		return -EINVAL;
302de586c74f7b Imran Khan        2022-05-11  256  =

302de586c74f7b Imran Khan        2022-05-11  257  	of->event =3D atomic_rea=
d(&unrcu_pointer(on)->event);
324a56e16e44ba Tejun Heo         2013-12-11  258  	ops =3D kernfs_ops(of->k=
n);
414985ae23c031 Tejun Heo         2013-11-28  259  	if (ops->read)
4eaad21a6ac986 Christoph Hellwig 2021-01-20  260  		len =3D ops->read(of, b=
uf, len, iocb->ki_pos);
414985ae23c031 Tejun Heo         2013-11-28  261  	else
414985ae23c031 Tejun Heo         2013-11-28  262  		len =3D -EINVAL;
414985ae23c031 Tejun Heo         2013-11-28  263  =

e4234a1fc343ca Chris Wilson      2016-03-31  264  	kernfs_put_active(of->kn=
);
e4234a1fc343ca Chris Wilson      2016-03-31  265  	mutex_unlock(&of->mutex);
e4234a1fc343ca Chris Wilson      2016-03-31  266  =

414985ae23c031 Tejun Heo         2013-11-28  267  	if (len < 0)
e4234a1fc343ca Chris Wilson      2016-03-31  268  		goto out_free;
414985ae23c031 Tejun Heo         2013-11-28  269  =

4eaad21a6ac986 Christoph Hellwig 2021-01-20  270  	if (copy_to_iter(buf, le=
n, iter) !=3D len) {
414985ae23c031 Tejun Heo         2013-11-28  271  		len =3D -EFAULT;
e4234a1fc343ca Chris Wilson      2016-03-31  272  		goto out_free;
414985ae23c031 Tejun Heo         2013-11-28  273  	}
414985ae23c031 Tejun Heo         2013-11-28  274  =

4eaad21a6ac986 Christoph Hellwig 2021-01-20  275  	iocb->ki_pos +=3D len;
414985ae23c031 Tejun Heo         2013-11-28  276  =

414985ae23c031 Tejun Heo         2013-11-28  277   out_free:
e4234a1fc343ca Chris Wilson      2016-03-31  278  	if (buf =3D=3D of->preal=
loc_buf)
e4234a1fc343ca Chris Wilson      2016-03-31  279  		mutex_unlock(&of->preal=
loc_mutex);
e4234a1fc343ca Chris Wilson      2016-03-31  280  	else
414985ae23c031 Tejun Heo         2013-11-28  281  		kfree(buf);
414985ae23c031 Tejun Heo         2013-11-28 @282  	return len;
414985ae23c031 Tejun Heo         2013-11-28  283  }
414985ae23c031 Tejun Heo         2013-11-28  284  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7858741641831665735==--

