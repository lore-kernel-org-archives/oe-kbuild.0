Content-Type: multipart/mixed; boundary="===============7501906194430882298=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-arm:clearfog 1/13] drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:441 mv88e6xxx_default_vid_show() error: uninitialized symbol 'err'.
Date: Wed, 05 Feb 2020 07:59:19 +0300
Message-ID: <20200205045919.GT11068@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7501906194430882298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.armlinux.org.uk/~rmk/linux-arm clearfog
head:   3450ae5b57e5f917cafd07c2ed4e5d3c57ffe313
commit: e07a5935928ac63761aa5c5de8a5d2fd68d7784d [1/13] net: dsa: mv88e6xxx=
: add debugfs interface

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:441 mv88e6xxx_default_vid_sho=
w() error: uninitialized symbol 'err'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:505 mv88e6xxx_fid_show() erro=
r: uninitialized symbol 'err'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:555 mv88e6xxx_state_show() er=
ror: uninitialized symbol 'ret'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:605 mv88e6xxx_8021q_mode_show=
() error: uninitialized symbol 'ret'.

git remote add linux-arm git://git.armlinux.org.uk/~rmk/linux-arm
git remote update linux-arm
git checkout e07a5935928ac63761aa5c5de8a5d2fd68d7784d
vim +/err +441 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

e07a5935928ac6 Vivien Didelot 2015-10-22  421  static int mv88e6xxx_default=
_vid_show(struct seq_file *s, void *p)
e07a5935928ac6 Vivien Didelot 2015-10-22  422  {
e07a5935928ac6 Vivien Didelot 2015-10-22  423  	struct mv88e6xxx_chip *chip=
 =3D s->private;
e07a5935928ac6 Vivien Didelot 2015-10-22  424  	u16 pvid;
e07a5935928ac6 Vivien Didelot 2015-10-22  425  	int i, err;
e07a5935928ac6 Vivien Didelot 2015-10-22  426  =

e07a5935928ac6 Vivien Didelot 2015-10-22  427  	seq_puts(s, " Port  Default=
VID\n");
e07a5935928ac6 Vivien Didelot 2015-10-22  428  =

e07a5935928ac6 Vivien Didelot 2015-10-22  429  	mutex_lock(&chip->reg_lock);
e07a5935928ac6 Vivien Didelot 2015-10-22  430  =

e07a5935928ac6 Vivien Didelot 2015-10-22  431  	for (i =3D 0; i < mv88e6xxx=
_num_ports(chip); ++i) {
                                                                ^^^^^^^^^^^=
^^^^^^^^^^^^^^
Smatch thinks this can be zero.

e07a5935928ac6 Vivien Didelot 2015-10-22  432  		err =3D mv88e6xxx_port_get=
_pvid(chip, i, &pvid);
e07a5935928ac6 Vivien Didelot 2015-10-22  433  		if (err)
e07a5935928ac6 Vivien Didelot 2015-10-22  434  			break;
e07a5935928ac6 Vivien Didelot 2015-10-22  435  =

e07a5935928ac6 Vivien Didelot 2015-10-22  436  		seq_printf(s, "%4d  %d\n",=
 i, pvid);
e07a5935928ac6 Vivien Didelot 2015-10-22  437  	}
e07a5935928ac6 Vivien Didelot 2015-10-22  438  =

e07a5935928ac6 Vivien Didelot 2015-10-22  439  	mutex_unlock(&chip->reg_loc=
k);
e07a5935928ac6 Vivien Didelot 2015-10-22  440  =

e07a5935928ac6 Vivien Didelot 2015-10-22 @441  	return err;
e07a5935928ac6 Vivien Didelot 2015-10-22  442  }
e07a5935928ac6 Vivien Didelot 2015-10-22  443  =

e07a5935928ac6 Vivien Didelot 2015-10-22  444  static ssize_t mv88e6xxx_def=
ault_vid_write(struct file *file,
e07a5935928ac6 Vivien Didelot 2015-10-22  445  					   const char __user *b=
uf, size_t count,
e07a5935928ac6 Vivien Didelot 2015-10-22  446  					   loff_t *ppos)
e07a5935928ac6 Vivien Didelot 2015-10-22  447  {
e07a5935928ac6 Vivien Didelot 2015-10-22  448  	struct seq_file *s =3D file=
->private_data;
e07a5935928ac6 Vivien Didelot 2015-10-22  449  	struct mv88e6xxx_chip *chip=
 =3D s->private;
e07a5935928ac6 Vivien Didelot 2015-10-22  450  	char cmd[32];
e07a5935928ac6 Vivien Didelot 2015-10-22  451  	unsigned int port, pvid;
e07a5935928ac6 Vivien Didelot 2015-10-22  452  	int ret;
e07a5935928ac6 Vivien Didelot 2015-10-22  453  =

e07a5935928ac6 Vivien Didelot 2015-10-22  454  	if (copy_from_user(cmd, buf=
, sizeof(cmd)))
e07a5935928ac6 Vivien Didelot 2015-10-22  455  		return -EFAULT;
e07a5935928ac6 Vivien Didelot 2015-10-22  456  =

e07a5935928ac6 Vivien Didelot 2015-10-22  457  	ret =3D sscanf(cmd, "%u %u"=
, &port, &pvid);
e07a5935928ac6 Vivien Didelot 2015-10-22  458  	if (ret !=3D 2)
e07a5935928ac6 Vivien Didelot 2015-10-22  459  		return -EINVAL;
e07a5935928ac6 Vivien Didelot 2015-10-22  460  =

e07a5935928ac6 Vivien Didelot 2015-10-22  461  	if (port >=3D mv88e6xxx_num=
_ports(chip) || pvid > 0xfff)
e07a5935928ac6 Vivien Didelot 2015-10-22  462  		return -ERANGE;
e07a5935928ac6 Vivien Didelot 2015-10-22  463  =

e07a5935928ac6 Vivien Didelot 2015-10-22  464  	mutex_lock(&chip->reg_lock);
e07a5935928ac6 Vivien Didelot 2015-10-22  465  	ret =3D mv88e6xxx_port_set_=
pvid(chip, port, pvid);
e07a5935928ac6 Vivien Didelot 2015-10-22  466  	mutex_unlock(&chip->reg_loc=
k);
e07a5935928ac6 Vivien Didelot 2015-10-22  467  =

e07a5935928ac6 Vivien Didelot 2015-10-22  468  	return ret < 0 ? ret : coun=
t;
e07a5935928ac6 Vivien Didelot 2015-10-22  469  }
e07a5935928ac6 Vivien Didelot 2015-10-22  470  =

e07a5935928ac6 Vivien Didelot 2015-10-22  471  static int mv88e6xxx_default=
_vid_open(struct inode *inode, struct file *file)
e07a5935928ac6 Vivien Didelot 2015-10-22  472  {
e07a5935928ac6 Vivien Didelot 2015-10-22  473  	return single_open(file, mv=
88e6xxx_default_vid_show, inode->i_private);
e07a5935928ac6 Vivien Didelot 2015-10-22  474  }
e07a5935928ac6 Vivien Didelot 2015-10-22  475  =

e07a5935928ac6 Vivien Didelot 2015-10-22  476  static const struct file_ope=
rations mv88e6xxx_default_vid_fops =3D {
e07a5935928ac6 Vivien Didelot 2015-10-22  477  	.open		=3D mv88e6xxx_defaul=
t_vid_open,
e07a5935928ac6 Vivien Didelot 2015-10-22  478  	.read		=3D seq_read,
e07a5935928ac6 Vivien Didelot 2015-10-22  479  	.write		=3D mv88e6xxx_defau=
lt_vid_write,
e07a5935928ac6 Vivien Didelot 2015-10-22  480  	.llseek		=3D no_llseek,
e07a5935928ac6 Vivien Didelot 2015-10-22  481  	.release	=3D single_release,
e07a5935928ac6 Vivien Didelot 2015-10-22  482  	.owner		=3D THIS_MODULE,
e07a5935928ac6 Vivien Didelot 2015-10-22  483  };
e07a5935928ac6 Vivien Didelot 2015-10-22  484  =

e07a5935928ac6 Vivien Didelot 2015-10-22  485  static int mv88e6xxx_fid_sho=
w(struct seq_file *s, void *p)
e07a5935928ac6 Vivien Didelot 2015-10-22  486  {
e07a5935928ac6 Vivien Didelot 2015-10-22  487  	struct mv88e6xxx_chip *chip=
 =3D s->private;
e07a5935928ac6 Vivien Didelot 2015-10-22  488  	u16 fid;
e07a5935928ac6 Vivien Didelot 2015-10-22  489  	int i, err;
e07a5935928ac6 Vivien Didelot 2015-10-22  490  =

e07a5935928ac6 Vivien Didelot 2015-10-22  491  	seq_puts(s, " Port  FID\n");
e07a5935928ac6 Vivien Didelot 2015-10-22  492  =

e07a5935928ac6 Vivien Didelot 2015-10-22  493  	mutex_lock(&chip->reg_lock);
e07a5935928ac6 Vivien Didelot 2015-10-22  494  =

e07a5935928ac6 Vivien Didelot 2015-10-22  495  	for (i =3D 0; i < mv88e6xxx=
_num_ports(chip); ++i) {
e07a5935928ac6 Vivien Didelot 2015-10-22  496  		err =3D mv88e6xxx_port_get=
_fid(chip, i, &fid);
e07a5935928ac6 Vivien Didelot 2015-10-22  497  		if (err)
e07a5935928ac6 Vivien Didelot 2015-10-22  498  			break;
e07a5935928ac6 Vivien Didelot 2015-10-22  499  =

e07a5935928ac6 Vivien Didelot 2015-10-22  500  		seq_printf(s, "%4d  %d\n",=
 i, fid);
e07a5935928ac6 Vivien Didelot 2015-10-22  501  	}
e07a5935928ac6 Vivien Didelot 2015-10-22  502  =

e07a5935928ac6 Vivien Didelot 2015-10-22  503  	mutex_unlock(&chip->reg_loc=
k);
e07a5935928ac6 Vivien Didelot 2015-10-22  504  =

e07a5935928ac6 Vivien Didelot 2015-10-22 @505  	return err;
e07a5935928ac6 Vivien Didelot 2015-10-22  506  }
e07a5935928ac6 Vivien Didelot 2015-10-22  507  =

e07a5935928ac6 Vivien Didelot 2015-10-22  508  static int mv88e6xxx_fid_ope=
n(struct inode *inode, struct file *file)
e07a5935928ac6 Vivien Didelot 2015-10-22  509  {
e07a5935928ac6 Vivien Didelot 2015-10-22  510  	return single_open(file, mv=
88e6xxx_fid_show, inode->i_private);
e07a5935928ac6 Vivien Didelot 2015-10-22  511  }
e07a5935928ac6 Vivien Didelot 2015-10-22  512  =

e07a5935928ac6 Vivien Didelot 2015-10-22  513  static const struct file_ope=
rations mv88e6xxx_fid_fops =3D {
e07a5935928ac6 Vivien Didelot 2015-10-22  514  	.open		=3D mv88e6xxx_fid_op=
en,
e07a5935928ac6 Vivien Didelot 2015-10-22  515  	.read		=3D seq_read,
e07a5935928ac6 Vivien Didelot 2015-10-22  516  	.llseek		=3D no_llseek,
e07a5935928ac6 Vivien Didelot 2015-10-22  517  	.release	=3D single_release,
e07a5935928ac6 Vivien Didelot 2015-10-22  518  	.owner		=3D THIS_MODULE,
e07a5935928ac6 Vivien Didelot 2015-10-22  519  };
e07a5935928ac6 Vivien Didelot 2015-10-22  520  =

e07a5935928ac6 Vivien Didelot 2015-10-22  521  static const char * const mv=
88e6xxx_port_state_names[] =3D {
e07a5935928ac6 Vivien Didelot 2015-10-22  522  	[MV88E6XXX_PORT_CTL0_STATE_=
DISABLED] =3D "Disabled",
e07a5935928ac6 Vivien Didelot 2015-10-22  523  	[MV88E6XXX_PORT_CTL0_STATE_=
BLOCKING] =3D "Blocking/Listening",
e07a5935928ac6 Vivien Didelot 2015-10-22  524  	[MV88E6XXX_PORT_CTL0_STATE_=
LEARNING] =3D "Learning",
e07a5935928ac6 Vivien Didelot 2015-10-22  525  	[MV88E6XXX_PORT_CTL0_STATE_=
FORWARDING] =3D "Forwarding",
e07a5935928ac6 Vivien Didelot 2015-10-22  526  };
e07a5935928ac6 Vivien Didelot 2015-10-22  527  =

e07a5935928ac6 Vivien Didelot 2015-10-22  528  static int mv88e6xxx_state_s=
how(struct seq_file *s, void *p)
e07a5935928ac6 Vivien Didelot 2015-10-22  529  {
e07a5935928ac6 Vivien Didelot 2015-10-22  530  	struct mv88e6xxx_chip *chip=
 =3D s->private;
e07a5935928ac6 Vivien Didelot 2015-10-22  531  	int i, ret;
e07a5935928ac6 Vivien Didelot 2015-10-22  532  	u16 data;
e07a5935928ac6 Vivien Didelot 2015-10-22  533  =

e07a5935928ac6 Vivien Didelot 2015-10-22  534  	/* header */
e07a5935928ac6 Vivien Didelot 2015-10-22  535  	seq_puts(s, " Port  Mode\n"=
);
e07a5935928ac6 Vivien Didelot 2015-10-22  536  =

e07a5935928ac6 Vivien Didelot 2015-10-22  537  	mutex_lock(&chip->reg_lock);
e07a5935928ac6 Vivien Didelot 2015-10-22  538  =

e07a5935928ac6 Vivien Didelot 2015-10-22  539  	/* One line per input port =
*/
e07a5935928ac6 Vivien Didelot 2015-10-22  540  	for (i =3D 0; i < mv88e6xxx=
_num_ports(chip); ++i) {
e07a5935928ac6 Vivien Didelot 2015-10-22  541  		seq_printf(s, "%4d ", i);
e07a5935928ac6 Vivien Didelot 2015-10-22  542  =

e07a5935928ac6 Vivien Didelot 2015-10-22  543  		ret =3D mv88e6xxx_port_rea=
d(chip, i, MV88E6XXX_PORT_CTL0, &data);
e07a5935928ac6 Vivien Didelot 2015-10-22  544  		if (ret < 0)
e07a5935928ac6 Vivien Didelot 2015-10-22  545  			goto unlock;
e07a5935928ac6 Vivien Didelot 2015-10-22  546  =

e07a5935928ac6 Vivien Didelot 2015-10-22  547  		data &=3D MV88E6XXX_PORT_C=
TL0_STATE_MASK;
e07a5935928ac6 Vivien Didelot 2015-10-22  548  		seq_printf(s, " %s\n", mv8=
8e6xxx_port_state_names[data]);
e07a5935928ac6 Vivien Didelot 2015-10-22  549  		ret =3D 0;
e07a5935928ac6 Vivien Didelot 2015-10-22  550  	}
e07a5935928ac6 Vivien Didelot 2015-10-22  551  =

e07a5935928ac6 Vivien Didelot 2015-10-22  552  unlock:
e07a5935928ac6 Vivien Didelot 2015-10-22  553  	mutex_unlock(&chip->reg_loc=
k);
e07a5935928ac6 Vivien Didelot 2015-10-22  554  =

e07a5935928ac6 Vivien Didelot 2015-10-22 @555  	return ret;
e07a5935928ac6 Vivien Didelot 2015-10-22  556  }
e07a5935928ac6 Vivien Didelot 2015-10-22  557  =

e07a5935928ac6 Vivien Didelot 2015-10-22  558  static int mv88e6xxx_state_o=
pen(struct inode *inode, struct file *file)
e07a5935928ac6 Vivien Didelot 2015-10-22  559  {
e07a5935928ac6 Vivien Didelot 2015-10-22  560  	return single_open(file, mv=
88e6xxx_state_show, inode->i_private);
e07a5935928ac6 Vivien Didelot 2015-10-22  561  }
e07a5935928ac6 Vivien Didelot 2015-10-22  562  =

e07a5935928ac6 Vivien Didelot 2015-10-22  563  static const struct file_ope=
rations mv88e6xxx_state_fops =3D {
e07a5935928ac6 Vivien Didelot 2015-10-22  564  	.open		=3D mv88e6xxx_state_=
open,
e07a5935928ac6 Vivien Didelot 2015-10-22  565  	.read		=3D seq_read,
e07a5935928ac6 Vivien Didelot 2015-10-22  566  	.llseek		=3D no_llseek,
e07a5935928ac6 Vivien Didelot 2015-10-22  567  	.release	=3D single_release,
e07a5935928ac6 Vivien Didelot 2015-10-22  568  	.owner		=3D THIS_MODULE,
e07a5935928ac6 Vivien Didelot 2015-10-22  569  };
e07a5935928ac6 Vivien Didelot 2015-10-22  570  =

e07a5935928ac6 Vivien Didelot 2015-10-22  571  static const char * const mv=
88e6xxx_port_8021q_mode_names[] =3D {
e07a5935928ac6 Vivien Didelot 2015-10-22  572  	[MV88E6XXX_PORT_CTL2_8021Q_=
MODE_DISABLED] =3D "Disabled",
e07a5935928ac6 Vivien Didelot 2015-10-22  573  	[MV88E6XXX_PORT_CTL2_8021Q_=
MODE_FALLBACK] =3D "Fallback",
e07a5935928ac6 Vivien Didelot 2015-10-22  574  	[MV88E6XXX_PORT_CTL2_8021Q_=
MODE_CHECK] =3D "Check",
e07a5935928ac6 Vivien Didelot 2015-10-22  575  	[MV88E6XXX_PORT_CTL2_8021Q_=
MODE_SECURE] =3D "Secure",
e07a5935928ac6 Vivien Didelot 2015-10-22  576  };
e07a5935928ac6 Vivien Didelot 2015-10-22  577  =

e07a5935928ac6 Vivien Didelot 2015-10-22  578  static int mv88e6xxx_8021q_m=
ode_show(struct seq_file *s, void *p)
e07a5935928ac6 Vivien Didelot 2015-10-22  579  {
e07a5935928ac6 Vivien Didelot 2015-10-22  580  	struct mv88e6xxx_chip *chip=
 =3D s->private;
e07a5935928ac6 Vivien Didelot 2015-10-22  581  	int i, ret;
e07a5935928ac6 Vivien Didelot 2015-10-22  582  	u16 data;
e07a5935928ac6 Vivien Didelot 2015-10-22  583  =

e07a5935928ac6 Vivien Didelot 2015-10-22  584  	/* header */
e07a5935928ac6 Vivien Didelot 2015-10-22  585  	seq_puts(s, " Port  Mode\n"=
);
e07a5935928ac6 Vivien Didelot 2015-10-22  586  =

e07a5935928ac6 Vivien Didelot 2015-10-22  587  	mutex_lock(&chip->reg_lock);
e07a5935928ac6 Vivien Didelot 2015-10-22  588  =

e07a5935928ac6 Vivien Didelot 2015-10-22  589  	/* One line per input port =
*/
e07a5935928ac6 Vivien Didelot 2015-10-22  590  	for (i =3D 0; i < mv88e6xxx=
_num_ports(chip); ++i) {
e07a5935928ac6 Vivien Didelot 2015-10-22  591  		seq_printf(s, "%4d ", i);
e07a5935928ac6 Vivien Didelot 2015-10-22  592  =

e07a5935928ac6 Vivien Didelot 2015-10-22  593  		ret =3D mv88e6xxx_port_rea=
d(chip, i, MV88E6XXX_PORT_CTL2, &data);
e07a5935928ac6 Vivien Didelot 2015-10-22  594  		if (ret < 0)
e07a5935928ac6 Vivien Didelot 2015-10-22  595  			goto unlock;
e07a5935928ac6 Vivien Didelot 2015-10-22  596  =

e07a5935928ac6 Vivien Didelot 2015-10-22  597  		data &=3D MV88E6XXX_PORT_C=
TL2_8021Q_MODE_MASK;
e07a5935928ac6 Vivien Didelot 2015-10-22  598  		seq_printf(s, " %s\n", mv8=
8e6xxx_port_8021q_mode_names[data]);
e07a5935928ac6 Vivien Didelot 2015-10-22  599  		ret =3D 0;
e07a5935928ac6 Vivien Didelot 2015-10-22  600  	}
e07a5935928ac6 Vivien Didelot 2015-10-22  601  =

e07a5935928ac6 Vivien Didelot 2015-10-22  602  unlock:
e07a5935928ac6 Vivien Didelot 2015-10-22  603  	mutex_unlock(&chip->reg_loc=
k);
e07a5935928ac6 Vivien Didelot 2015-10-22  604  =

e07a5935928ac6 Vivien Didelot 2015-10-22 @605  	return ret;
e07a5935928ac6 Vivien Didelot 2015-10-22  606  }
e07a5935928ac6 Vivien Didelot 2015-10-22  607  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============7501906194430882298==--

