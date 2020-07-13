Content-Type: multipart/mixed; boundary="===============8683946106002709156=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2534/7824] drivers/tty/vt/vt_ioctl.c:377 vt_k_ioctl() warn: ignoring unreachable code.
Date: Mon, 13 Jul 2020 21:47:58 +0800
Message-ID: <202007132150.epJlg7do%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8683946106002709156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jiri Slaby <jslaby@suse.cz>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   be978f8feb1d4678b941a3ccf181eea1039110e2
commit: 832a62ab6b7d32243266f1829bfa4ea85c95065a [2534/7824] vt_ioctl: move=
 K* ioctls to a separate function
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: h8300-randconfig-m031-20200713 (attached as .config)
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/tty/vt/vt_ioctl.c:377 vt_k_ioctl() warn: ignoring unreachable code.

Old smatch warnings:
drivers/tty/vt/vt_ioctl.c:397 vt_k_ioctl() warn: ignoring unreachable code.
drivers/tty/vt/vt_ioctl.c:406 vt_k_ioctl() warn: ignoring unreachable code.
drivers/tty/vt/vt_ioctl.c:667 vt_ioctl() warn: ignoring unreachable code.
drivers/tty/vt/vt_ioctl.c:680 vt_ioctl() warn: ignoring unreachable code.
drivers/tty/vt/vt_ioctl.c:995 vt_ioctl() warn: ignoring unreachable code.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D832a62ab6b7d32243266f1829bfa4ea85c95065a
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout 832a62ab6b7d32243266f1829bfa4ea85c95065a
vim +377 drivers/tty/vt/vt_ioctl.c

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  316  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  317 =
 	/* Linux m68k/i386 interface for setting the keyboard delay/repeat rate */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  318  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  319 =
 	case KDKBDREP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  320 =
 	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  321 =
 		struct kbd_repeat kbrep;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  322  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  323 =
 		if (!capable(CAP_SYS_TTY_CONFIG))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  324 =
 			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  325  =

0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  326 =
 		if (copy_from_user(&kbrep, up, sizeof(struct kbd_repeat)))
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  327 =
 			return -EFAULT;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  328  =

9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  329 =
 		ret =3D kbd_rate(&kbrep);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  330 =
 		if (ret)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  331 =
 			return ret;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  332 =
 		if (copy_to_user(up, &kbrep, sizeof(struct kbd_repeat)))
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  333 =
 			return -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  334 =
 		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  335 =
 	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  336  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  337 =
 	case KDSETMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  338 =
 		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  339 =
 		 * currently, setting the mode from KD_TEXT to KD_GRAPHICS
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  340 =
 		 * doesn't do a whole lot. i'm not sure if it should do any
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  341 =
 		 * restoration of modes or what...
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  342 =
 		 *
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  343 =
 		 * XXX It should at least call into the driver, fbdev's definitely
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  344 =
 		 * need to restore their engine state. --BenH
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  345 =
 		 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  346 =
 		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  347 =
 			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  348 =
 		switch (arg) {
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  349 =
 		case KD_GRAPHICS:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  350 =
 			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  351 =
 		case KD_TEXT0:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  352 =
 		case KD_TEXT1:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  353 =
 			arg =3D KD_TEXT;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  354 =
 		case KD_TEXT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  355 =
 			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  356 =
 		default:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  357 =
 			return -EINVAL;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  358 =
 		}
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  359 =
 		/* FIXME: this needs the console lock extending */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  360 =
 		if (vc->vc_mode =3D=3D (unsigned char) arg)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  361 =
 			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  362 =
 		vc->vc_mode =3D (unsigned char) arg;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  363 =
 		if (console !=3D fg_console)
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  364 =
 			break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  365 =
 		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  366 =
 		 * explicitly blank/unblank the screen if switching modes
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  367 =
 		 */
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn       2011-01-25  368 =
 		console_lock();
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  369 =
 		if (arg =3D=3D KD_TEXT)
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  370 =
 			do_unblank_screen(1);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  371 =
 		else
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  372 =
 			do_blank_screen(1);
ac751efa6a0d70 drivers/tty/vt/vt_ioctl.c Torben Hohn       2011-01-25  373 =
 		console_unlock();
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  374 =
 		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  375  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  376 =
 	case KDGETMODE:
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15 @377 =
 		return put_user(vc->vc_mode, (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  378  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  379 =
 	case KDMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  380 =
 	case KDUNMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  381 =
 		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  382 =
 		 * these work like a combination of mmap and KDENABIO.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  383 =
 		 * this could be easily finished.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  384 =
 		 */
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  385 =
 		return -EINVAL;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  386  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  387 =
 	case KDSKBMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  388 =
 		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  389 =
 			return -EPERM;
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-28  390 =
 		ret =3D vt_do_kdskbmode(console, arg);
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  391 =
 		if (ret)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  392 =
 			return ret;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  393 =
 		tty_ldisc_flush(tty);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  394 =
 		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  395  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  396 =
 	case KDGKBMODE:
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  397 =
 		return put_user(vt_do_kdgkbmode(console), (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  398  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  399 =
 	/* this could be folded into KDSKBMODE, but for compatibility
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  400 =
 	   reasons it is not so easy to fold KDGKBMETA into KDGKBMODE */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  401 =
 	case KDSKBMETA:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  402 =
 		return vt_do_kdskbmeta(console, arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  403  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  404 =
 	case KDGKBMETA:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-28  405 =
 		/* FIXME: should review whether this is worth locking */
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  406 =
 		return put_user(vt_do_kdgkbmeta(console), (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  407  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  408 =
 	case KDGETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  409 =
 	case KDSETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  410 =
 		if(!capable(CAP_SYS_TTY_CONFIG))
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  411 =
 			perm =3D 0;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  412 =
 		return vt_do_kbkeycode_ioctl(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  413  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  414 =
 	case KDGKBENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  415 =
 	case KDSKBENT:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  416 =
 		return vt_do_kdsk_ioctl(cmd, up, perm, console);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  417  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  418 =
 	case KDGKBSENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  419 =
 	case KDSKBSENT:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  420 =
 		return vt_do_kdgkb_ioctl(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  421  =

247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-24  422 =
 	/* Diacritical processing. Handled in keyboard.c as it has
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-24  423 =
 	   to operate on the keyboard locks and structures */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  424 =
 	case KDGKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault   2007-10-16  425 =
 	case KDGKBDIACRUC:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  426 =
 	case KDSKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault   2007-10-16  427 =
 	case KDSKBDIACRUC:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  428 =
 		return vt_do_diacrit(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  429  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  430 =
 	/* the ioctls below read/set the flags usually shown in the leds */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  431 =
 	/* don't use them - they will go away without warning */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  432 =
 	case KDGKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  433 =
 	case KDSKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  434 =
 	case KDGETLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  435 =
 	case KDSETLED:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  436 =
 		return vt_do_kdskled(console, cmd, arg, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  437  =

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  438 =
 	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  439 =
 	 * A process can indicate its willingness to accept signals
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  440 =
 	 * generated by pressing an appropriate key combination.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  441 =
 	 * Thus, one can have a daemon that e.g. spawns a new console
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  442 =
 	 * upon a keypress and then changes to it.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  443 =
 	 * See also the kbrequest field of inittab(5).
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  444 =
 	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  445 =
 	case KDSIGACCEPT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  446 =
 		if (!perm || !capable(CAP_KILL))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  447 =
 			return -EPERM;
7ed20e1ad521b5 drivers/char/vt_ioctl.c   Jesper Juhl       2005-05-01  448 =
 		if (!valid_signal(arg) || arg < 1 || arg =3D=3D SIGKILL)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  449 =
 			return -EINVAL;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  450  =

81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  451 =
 		spin_lock_irq(&vt_spawn_con.lock);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  452 =
 		put_pid(vt_spawn_con.pid);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  453 =
 		vt_spawn_con.pid =3D get_pid(task_pid(current));
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  454 =
 		vt_spawn_con.sig =3D arg;
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  455 =
 		spin_unlock_irq(&vt_spawn_con.lock);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  456 =
 		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  457  =

832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  458 =
 	case KDFONTOP: {
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  459 =
 		struct console_font_op op;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  460  =

832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  461 =
 		if (copy_from_user(&op, up, sizeof(op)))
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  462 =
 			return -EFAULT;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  463 =
 		if (!perm && op.op !=3D KD_FONT_OP_GET)
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  464 =
 			return -EPERM;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  465 =
 		ret =3D con_font_op(vc, &op);
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  466 =
 		if (ret)
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  467 =
 			return ret;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  468 =
 		if (copy_to_user(up, &op, sizeof(op)))
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  469 =
 			return -EFAULT;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  470 =
 		break;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  471 =
 	}
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  472  =

832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  473 =
 	default:
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  474 =
 		return -ENOIOCTLCMD;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  475 =
 	}
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  476  =

832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  477 =
 	return 0;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  478 =
 }
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  479  =


:::::: The code@line 377 was first introduced by commit
:::::: eca734d8f0043e9597c9426f829d48c381dbb388 vt_ioctl: eliminate use of =
uival and ucval

:::::: TO: Jiri Slaby <jslaby@suse.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8683946106002709156==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8683946106002709156==--

