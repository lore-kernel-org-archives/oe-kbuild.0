Content-Type: multipart/mixed; boundary="===============1213346769353078531=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] scripts/coccinelle: Add script to detect sign extension
Date: Fri, 19 Mar 2021 19:21:45 +0800
Message-ID: <202103191912.Z4rOqxUI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1213346769353078531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210319142952.1.I2c82789dba4e68d61595862188e8bf4d31a05d38@=
changeid>
References: <20210319142952.1.I2c82789dba4e68d61595862188e8bf4d31a05d38@c=
hangeid>
TO: Evan Benn <evanbenn@chromium.org>
TO: Julia Lawall <Julia.Lawall@inria.fr>
CC: Evan Benn <evanbenn@chromium.org>
CC: Gilles Muller <Gilles.Muller@inria.fr>
CC: Michal Marek <michal.lkml@markovi.net>
CC: Nicolas Palix <nicolas.palix@imag.fr>
CC: cocci(a)systeme.lip6.fr
CC: linux-kernel(a)vger.kernel.org

Hi Evan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mmarek/misc]
[also build test WARNING on v5.12-rc3 next-20210319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Evan-Benn/scripts-coccinel=
le-Add-script-to-detect-sign-extension/20210319-113907
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git m=
isc
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: sparc64-randconfig-c003-20210318 (attached as .config)
compiler: sparc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/block/floppy.c:3491:55-59: sign extension when comparing bits of=
 signed and unsigned values

vim +3491 drivers/block/floppy.c

a885c8c4316e1c Christoph Hellwig 2006-01-08  3380  =

8a6cfeb6deca3a Arnd Bergmann     2010-07-08  3381  static int fd_locked_ioc=
tl(struct block_device *bdev, fmode_t mode, unsigned int cmd,
^1da177e4c3f41 Linus Torvalds    2005-04-16  3382  		    unsigned long para=
m)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3383  {
a4af9b48cb480f Al Viro           2008-03-02  3384  	int drive =3D (long)bde=
v->bd_disk->private_data;
06f748c4754de4 Jesper Juhl       2007-10-16  3385  	int type =3D ITYPE(UDRS=
->fd_device);
06f748c4754de4 Jesper Juhl       2007-10-16  3386  	int i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3387  	int ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3388  	int size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3389  	union inparam {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3390  		struct floppy_struct g=
;	/* geometry */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3391  		struct format_descr f;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3392  		struct floppy_max_erro=
rs max_errors;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3393  		struct floppy_drive_pa=
rams dp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3394  	} inparam;		/* paramete=
rs coming from user space */
724ee626f38fea Joe Perches       2010-03-10  3395  	const void *outparam;	/=
* parameters passed back to user space */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3396  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3397  	/* convert compatibilit=
y eject ioctls into floppy eject ioctl.
^1da177e4c3f41 Linus Torvalds    2005-04-16  3398  	 * We do this in order =
to provide a means to eject floppy disks before
^1da177e4c3f41 Linus Torvalds    2005-04-16  3399  	 * installing the new f=
dutils package */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3400  	if (cmd =3D=3D CDROMEJE=
CT ||	/* CD-ROM eject */
a81ee5447157a4 Joe Perches       2010-03-10  3401  	    cmd =3D=3D 0x6470) =
{		/* SunOS floppy eject */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3402  		DPRINT("obsolete eject=
 ioctl\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3403  		DPRINT("please use flo=
ppycontrol --eject\n");
^1da177e4c3f41 Linus Torvalds    2005-04-16  3404  		cmd =3D FDEJECT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3405  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3406  =

a81ee5447157a4 Joe Perches       2010-03-10  3407  	if (!((cmd & 0xff00) =
=3D=3D 0x0200))
a81ee5447157a4 Joe Perches       2010-03-10  3408  		return -EINVAL;
a81ee5447157a4 Joe Perches       2010-03-10  3409  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3410  	/* convert the old styl=
e command into a new style command */
4575b55281825d Joe Perches       2010-03-10  3411  	ret =3D normalize_ioctl=
(&cmd, &size);
4575b55281825d Joe Perches       2010-03-10  3412  	if (ret)
4575b55281825d Joe Perches       2010-03-10  3413  		return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3414  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3415  	/* permission checks */
0aad92cfea6fec Joe Perches       2010-03-10  3416  	if (((cmd & 0x40) && !(=
mode & (FMODE_WRITE | FMODE_WRITE_IOCTL))) ||
^1da177e4c3f41 Linus Torvalds    2005-04-16  3417  	    ((cmd & 0x80) && !c=
apable(CAP_SYS_ADMIN)))
^1da177e4c3f41 Linus Torvalds    2005-04-16  3418  		return -EPERM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3419  =

2886a8bdfa0070 Arjan van de Ven  2009-12-14  3420  	if (WARN_ON(size < 0 ||=
 size > sizeof(inparam)))
2886a8bdfa0070 Arjan van de Ven  2009-12-14  3421  		return -EINVAL;
2886a8bdfa0070 Arjan van de Ven  2009-12-14  3422  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3423  	/* copyin */
b87c9e0a880f29 Joe Perches       2010-03-10  3424  	memset(&inparam, 0, siz=
eof(inparam));
4575b55281825d Joe Perches       2010-03-10  3425  	if (_IOC_DIR(cmd) & _IO=
C_WRITE) {
4575b55281825d Joe Perches       2010-03-10  3426  		ret =3D fd_copyin((voi=
d __user *)param, &inparam, size);
4575b55281825d Joe Perches       2010-03-10  3427  		if (ret)
4575b55281825d Joe Perches       2010-03-10  3428  			return ret;
4575b55281825d Joe Perches       2010-03-10  3429  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3430  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3431  	switch (cmd) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  3432  	case FDEJECT:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3433  		if (UDRS->fd_ref !=3D =
1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3434  			/* somebody else has =
this drive open */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3435  			return -EBUSY;
a0c80efe5956cc Jiri Kosina       2016-02-01  3436  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3437  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3438  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3439  		/* do the actual eject=
. Fails on
^1da177e4c3f41 Linus Torvalds    2005-04-16  3440  		 * non-Sparc architect=
ures */
^1da177e4c3f41 Linus Torvalds    2005-04-16  3441  		ret =3D fd_eject(UNIT(=
drive));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3442  =

e029853612ba59 Joe Perches       2010-03-10  3443  		set_bit(FD_DISK_CHANGE=
D_BIT, &UDRS->flags);
e029853612ba59 Joe Perches       2010-03-10  3444  		set_bit(FD_VERIFY_BIT,=
 &UDRS->flags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3445  		process_fd_request();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3446  		return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3447  	case FDCLRPRM:
a0c80efe5956cc Jiri Kosina       2016-02-01  3448  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3449  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3450  		current_type[drive] =
=3D NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3451  		floppy_sizes[drive] =
=3D MAX_DISK_SIZE << 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3452  		UDRS->keep_data =3D 0;
a4af9b48cb480f Al Viro           2008-03-02  3453  		return invalidate_driv=
e(bdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3454  	case FDSETPRM:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3455  	case FDDEFPRM:
da27365342868d Joe Perches       2010-03-10  3456  		return set_geometry(cm=
d, &inparam.g, drive, type, bdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3457  	case FDGETPRM:
4575b55281825d Joe Perches       2010-03-10  3458  		ret =3D get_floppy_geo=
metry(drive, type,
724ee626f38fea Joe Perches       2010-03-10  3459  					  (struct floppy_st=
ruct **)&outparam);
4575b55281825d Joe Perches       2010-03-10  3460  		if (ret)
4575b55281825d Joe Perches       2010-03-10  3461  			return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3462  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3463  	case FDMSGON:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3464  		UDP->flags |=3D FTD_MS=
G;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3465  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3466  	case FDMSGOFF:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3467  		UDP->flags &=3D ~FTD_M=
SG;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3468  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3469  	case FDFMTBEG:
a0c80efe5956cc Jiri Kosina       2016-02-01  3470  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3471  			return -EINTR;
74f63f469ed1ce Joe Perches       2010-03-10  3472  		if (poll_drive(true, F=
D_RAW_NEED_DISK) =3D=3D -EINTR)
4575b55281825d Joe Perches       2010-03-10  3473  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3474  		ret =3D UDRS->flags;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3475  		process_fd_request();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3476  		if (ret & FD_VERIFY)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3477  			return -ENODEV;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3478  		if (!(ret & FD_DISK_WR=
ITABLE))
^1da177e4c3f41 Linus Torvalds    2005-04-16  3479  			return -EROFS;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3480  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3481  	case FDFMTTRK:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3482  		if (UDRS->fd_ref !=3D =
1)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3483  			return -EBUSY;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3484  		return do_format(drive=
, &inparam.f);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3485  	case FDFMTEND:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3486  	case FDFLUSH:
a0c80efe5956cc Jiri Kosina       2016-02-01  3487  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3488  			return -EINTR;
a4af9b48cb480f Al Viro           2008-03-02  3489  		return invalidate_driv=
e(bdev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3490  	case FDSETEMSGTRESH:
da27365342868d Joe Perches       2010-03-10 @3491  		UDP->max_errors.report=
ing =3D (unsigned short)(param & 0x0f);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3492  		return 0;
da27365342868d Joe Perches       2010-03-10  3493  	case FDGETMAXERRS:
724ee626f38fea Joe Perches       2010-03-10  3494  		outparam =3D &UDP->max=
_errors;
da27365342868d Joe Perches       2010-03-10  3495  		break;
da27365342868d Joe Perches       2010-03-10  3496  	case FDSETMAXERRS:
da27365342868d Joe Perches       2010-03-10  3497  		UDP->max_errors =3D in=
param.max_errors;
da27365342868d Joe Perches       2010-03-10  3498  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3499  	case FDGETDRVTYP:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3500  		outparam =3D drive_nam=
e(type, drive);
724ee626f38fea Joe Perches       2010-03-10  3501  		SUPBOUND(size, strlen(=
(const char *)outparam) + 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  3502  		break;
da27365342868d Joe Perches       2010-03-10  3503  	case FDSETDRVPRM:
da27365342868d Joe Perches       2010-03-10  3504  		*UDP =3D inparam.dp;
da27365342868d Joe Perches       2010-03-10  3505  		break;
da27365342868d Joe Perches       2010-03-10  3506  	case FDGETDRVPRM:
724ee626f38fea Joe Perches       2010-03-10  3507  		outparam =3D UDP;
da27365342868d Joe Perches       2010-03-10  3508  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3509  	case FDPOLLDRVSTAT:
a0c80efe5956cc Jiri Kosina       2016-02-01  3510  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3511  			return -EINTR;
74f63f469ed1ce Joe Perches       2010-03-10  3512  		if (poll_drive(true, F=
D_RAW_NEED_DISK) =3D=3D -EINTR)
4575b55281825d Joe Perches       2010-03-10  3513  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3514  		process_fd_request();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3515  		/* fall through */
da27365342868d Joe Perches       2010-03-10  3516  	case FDGETDRVSTAT:
724ee626f38fea Joe Perches       2010-03-10  3517  		outparam =3D UDRS;
da27365342868d Joe Perches       2010-03-10  3518  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3519  	case FDRESET:
74f63f469ed1ce Joe Perches       2010-03-10  3520  		return user_reset_fdc(=
drive, (int)param, true);
da27365342868d Joe Perches       2010-03-10  3521  	case FDGETFDCSTAT:
724ee626f38fea Joe Perches       2010-03-10  3522  		outparam =3D UFDCS;
da27365342868d Joe Perches       2010-03-10  3523  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3524  	case FDWERRORCLR:
b87c9e0a880f29 Joe Perches       2010-03-10  3525  		memset(UDRWE, 0, sizeo=
f(*UDRWE));
^1da177e4c3f41 Linus Torvalds    2005-04-16  3526  		return 0;
da27365342868d Joe Perches       2010-03-10  3527  	case FDWERRORGET:
724ee626f38fea Joe Perches       2010-03-10  3528  		outparam =3D UDRWE;
da27365342868d Joe Perches       2010-03-10  3529  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3530  	case FDRAWCMD:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3531  		if (type)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3532  			return -EINVAL;
a0c80efe5956cc Jiri Kosina       2016-02-01  3533  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3534  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3535  		set_floppy(drive);
4575b55281825d Joe Perches       2010-03-10  3536  		i =3D raw_cmd_ioctl(cm=
d, (void __user *)param);
4575b55281825d Joe Perches       2010-03-10  3537  		if (i =3D=3D -EINTR)
4575b55281825d Joe Perches       2010-03-10  3538  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3539  		process_fd_request();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3540  		return i;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3541  	case FDTWADDLE:
a0c80efe5956cc Jiri Kosina       2016-02-01  3542  		if (lock_fdc(drive))
52a0d61f64123a Joe Perches       2010-03-10  3543  			return -EINTR;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3544  		twaddle();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3545  		process_fd_request();
^1da177e4c3f41 Linus Torvalds    2005-04-16  3546  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3547  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  3548  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3549  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  3550  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3551  	if (_IOC_DIR(cmd) & _IO=
C_READ)
^1da177e4c3f41 Linus Torvalds    2005-04-16  3552  		return fd_copyout((voi=
d __user *)param, outparam, size);
da27365342868d Joe Perches       2010-03-10  3553  =

^1da177e4c3f41 Linus Torvalds    2005-04-16  3554  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  3555  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  3556  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1213346769353078531==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
A5Yd1OcHAPgfph5ZfZ9QAQA=
--===============1213346769353078531==--

