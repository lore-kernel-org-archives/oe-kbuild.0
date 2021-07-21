Content-Type: multipart/mixed; boundary="===============9142724752404864652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pci:review/vga 1/7] drivers/pci/vgaarb.c:1045:8: warning: %d in format string (no. 6) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Wed, 21 Jul 2021 16:19:16 +0800
Message-ID: <202107211659.UlOWyuVa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9142724752404864652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Bjorn Helgaas <helgaas@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git rev=
iew/vga
head:   b6f0a577c4fbcc4f1e7eaf0e9a30bcfd20002b44
commit: 4e5cfb7f1564325ed08a95271ecdca1f6709d106 [1/7] PCI/VGA: Move vgaarb=
 to drivers/pci
:::::: branch date: 10 hours ago
:::::: commit date: 12 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/pci/vgaarb.c:1045:8: warning: %d in format string (no. 6) requir=
es 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sin=
t]
    len =3D snprintf(lbuf, 1024,
          ^
   drivers/pci/vgaarb.c:1045:8: warning: %d in format string (no. 7) requir=
es 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sin=
t]
    len =3D snprintf(lbuf, 1024,
          ^

vim +1045 drivers/pci/vgaarb.c

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1002  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1003  static ssize_t vga_arb_read(struct file *file, char __user *buf,
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1004  			    size_t count, loff_t *ppos)
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1005  {
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1006  	struct vga_arb_private *priv =3D file->private_data;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1007  	struct vga_device *vgadev;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1008  	struct pci_dev *pdev;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1009  	unsigned long flags;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1010  	size_t len;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1011  	int rc;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1012  	char *lbuf;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1013  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1014  	lbuf =3D kmalloc(1024, GFP_KERNEL);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1015  	if (lbuf =3D=3D NULL)
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1016  		return -ENOMEM;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1017  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1018  	/* Shields against vga_arb_device_card_gone (pci_dev going
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1019  	 * away), and allows access to vga list
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1020  	 */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1021  	spin_lock_irqsave(&vga_lock, flags);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1022  =

25985edcedea6396 drivers/gpu/vga/vgaarb.c Lucas De Marchi        2011-03-30=
  1023  	/* If we are targeting the default, use it */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1024  	pdev =3D priv->target;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1025  	if (pdev =3D=3D NULL || pdev =3D=3D PCI_INVALID_CARD) {
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1026  		spin_unlock_irqrestore(&vga_lock, flags);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1027  		len =3D sprintf(lbuf, "invalid");
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1028  		goto done;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1029  	}
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1030  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1031  	/* Find card vgadev structure */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1032  	vgadev =3D vgadev_find(pdev);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1033  	if (vgadev =3D=3D NULL) {
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1034  		/* Wow, it's not in the list, that shouldn't happen,
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1035  		 * let's fix us up and return invalid card
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1036  		 */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1037  		if (pdev =3D=3D priv->target)
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1038  			vga_arb_device_card_gone(pdev);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1039  		spin_unlock_irqrestore(&vga_lock, flags);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1040  		len =3D sprintf(lbuf, "invalid");
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1041  		goto done;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1042  	}
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1043  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1044  	/* Fill the buffer with infos */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
 @1045  	len =3D snprintf(lbuf, 1024,
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1046  		       "count:%d,PCI:%s,decodes=3D%s,owns=3D%s,locks=3D%s(%d:%d)\=
n",
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1047  		       vga_decode_count, pci_name(pdev),
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1048  		       vga_iostate_to_str(vgadev->decodes),
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1049  		       vga_iostate_to_str(vgadev->owns),
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1050  		       vga_iostate_to_str(vgadev->locks),
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1051  		       vgadev->io_lock_cnt, vgadev->mem_lock_cnt);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1052  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1053  	spin_unlock_irqrestore(&vga_lock, flags);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1054  done:
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1055  =

deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1056  	/* Copy that to user */
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1057  	if (len > count)
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1058  		len =3D count;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1059  	rc =3D copy_to_user(buf, lbuf, len);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1060  	kfree(lbuf);
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1061  	if (rc)
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1062  		return -EFAULT;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1063  	return len;
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1064  }
deb2d2ecd43dfc51 drivers/gpu/vga/vgaarb.c Benjamin Herrenschmidt 2009-08-11=
  1065  =


:::::: The code at line 1045 was first introduced by commit
:::::: deb2d2ecd43dfc51efe71eed7128fda514da96c6 PCI/GPU: implement VGA arbi=
tration on Linux

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Jesse Barnes <jbarnes@virtuousgeek.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9142724752404864652==--

