Content-Type: multipart/mixed; boundary="===============1025828111437803268=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [arm:clearfog 2/13] drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:441 mv88e6xxx_default_vid_show() error: uninitialized symbol 'err'.
Date: Wed, 15 Dec 2021 04:18:46 +0800
Message-ID: <202112150402.dLYfw6VE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1025828111437803268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Russell King <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git clearfog
head:   31ca7cd503d73e8da285382d31b7be1c7a7da479
commit: 79d4556027c96d9cb569bf50ae889fd148344999 [2/13] net: dsa: mv88e6xxx=
: debugfs hacks to fix the compile
:::::: branch date: 8 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-m001-20211214 (https://download.01.org/0day-ci/ar=
chive/20211215/202112150402.dLYfw6VE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:441 mv88e6xxx_default_vid_sho=
w() error: uninitialized symbol 'err'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:505 mv88e6xxx_fid_show() erro=
r: uninitialized symbol 'err'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:555 mv88e6xxx_state_show() er=
ror: uninitialized symbol 'ret'.
drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c:605 mv88e6xxx_8021q_mode_show=
() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/net/dsa/mv88e6xxx/chip.c:2747 mv88e6xxx_serdes_irq_request() warn: =
'irq' not released on lines: 2747.

vim +/err +441 drivers/net/dsa/mv88e6xxx/mv88e6xxx_debugfs.c

fe8a2a1725d821b Vivien Didelot 2015-10-22  420  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  421  static int mv88e6xxx_defaul=
t_vid_show(struct seq_file *s, void *p)
fe8a2a1725d821b Vivien Didelot 2015-10-22  422  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  423  	struct mv88e6xxx_chip *chi=
p =3D s->private;
fe8a2a1725d821b Vivien Didelot 2015-10-22  424  	u16 pvid;
fe8a2a1725d821b Vivien Didelot 2015-10-22  425  	int i, err;
fe8a2a1725d821b Vivien Didelot 2015-10-22  426  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  427  	seq_puts(s, " Port  Defaul=
tVID\n");
fe8a2a1725d821b Vivien Didelot 2015-10-22  428  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  429  	mutex_lock(&chip->reg_lock=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  430  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  431  	for (i =3D 0; i < mv88e6xx=
x_num_ports(chip); ++i) {
fe8a2a1725d821b Vivien Didelot 2015-10-22  432  		err =3D mv88e6xxx_port_ge=
t_pvid(chip, i, &pvid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  433  		if (err)
fe8a2a1725d821b Vivien Didelot 2015-10-22  434  			break;
fe8a2a1725d821b Vivien Didelot 2015-10-22  435  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  436  		seq_printf(s, "%4d  %d\n"=
, i, pvid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  437  	}
fe8a2a1725d821b Vivien Didelot 2015-10-22  438  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  439  	mutex_unlock(&chip->reg_lo=
ck);
fe8a2a1725d821b Vivien Didelot 2015-10-22  440  =

fe8a2a1725d821b Vivien Didelot 2015-10-22 @441  	return err;
fe8a2a1725d821b Vivien Didelot 2015-10-22  442  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  443  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  444  static ssize_t mv88e6xxx_de=
fault_vid_write(struct file *file,
fe8a2a1725d821b Vivien Didelot 2015-10-22  445  					   const char __user *=
buf, size_t count,
fe8a2a1725d821b Vivien Didelot 2015-10-22  446  					   loff_t *ppos)
fe8a2a1725d821b Vivien Didelot 2015-10-22  447  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  448  	struct seq_file *s =3D fil=
e->private_data;
fe8a2a1725d821b Vivien Didelot 2015-10-22  449  	struct mv88e6xxx_chip *chi=
p =3D s->private;
fe8a2a1725d821b Vivien Didelot 2015-10-22  450  	char cmd[32];
fe8a2a1725d821b Vivien Didelot 2015-10-22  451  	unsigned int port, pvid;
fe8a2a1725d821b Vivien Didelot 2015-10-22  452  	int ret;
fe8a2a1725d821b Vivien Didelot 2015-10-22  453  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  454  	if (copy_from_user(cmd, bu=
f, sizeof(cmd)))
fe8a2a1725d821b Vivien Didelot 2015-10-22  455  		return -EFAULT;
fe8a2a1725d821b Vivien Didelot 2015-10-22  456  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  457  	ret =3D sscanf(cmd, "%u %u=
", &port, &pvid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  458  	if (ret !=3D 2)
fe8a2a1725d821b Vivien Didelot 2015-10-22  459  		return -EINVAL;
fe8a2a1725d821b Vivien Didelot 2015-10-22  460  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  461  	if (port >=3D mv88e6xxx_nu=
m_ports(chip) || pvid > 0xfff)
fe8a2a1725d821b Vivien Didelot 2015-10-22  462  		return -ERANGE;
fe8a2a1725d821b Vivien Didelot 2015-10-22  463  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  464  	mutex_lock(&chip->reg_lock=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  465  	ret =3D mv88e6xxx_port_set=
_pvid(chip, port, pvid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  466  	mutex_unlock(&chip->reg_lo=
ck);
fe8a2a1725d821b Vivien Didelot 2015-10-22  467  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  468  	return ret < 0 ? ret : cou=
nt;
fe8a2a1725d821b Vivien Didelot 2015-10-22  469  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  470  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  471  static int mv88e6xxx_defaul=
t_vid_open(struct inode *inode, struct file *file)
fe8a2a1725d821b Vivien Didelot 2015-10-22  472  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  473  	return single_open(file, m=
v88e6xxx_default_vid_show, inode->i_private);
fe8a2a1725d821b Vivien Didelot 2015-10-22  474  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  475  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  476  static const struct file_op=
erations mv88e6xxx_default_vid_fops =3D {
fe8a2a1725d821b Vivien Didelot 2015-10-22  477  	.open		=3D mv88e6xxx_defau=
lt_vid_open,
fe8a2a1725d821b Vivien Didelot 2015-10-22  478  	.read		=3D seq_read,
fe8a2a1725d821b Vivien Didelot 2015-10-22  479  	.write		=3D mv88e6xxx_defa=
ult_vid_write,
fe8a2a1725d821b Vivien Didelot 2015-10-22  480  	.llseek		=3D no_llseek,
fe8a2a1725d821b Vivien Didelot 2015-10-22  481  	.release	=3D single_releas=
e,
fe8a2a1725d821b Vivien Didelot 2015-10-22  482  	.owner		=3D THIS_MODULE,
fe8a2a1725d821b Vivien Didelot 2015-10-22  483  };
fe8a2a1725d821b Vivien Didelot 2015-10-22  484  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  485  static int mv88e6xxx_fid_sh=
ow(struct seq_file *s, void *p)
fe8a2a1725d821b Vivien Didelot 2015-10-22  486  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  487  	struct mv88e6xxx_chip *chi=
p =3D s->private;
fe8a2a1725d821b Vivien Didelot 2015-10-22  488  	u16 fid;
fe8a2a1725d821b Vivien Didelot 2015-10-22  489  	int i, err;
fe8a2a1725d821b Vivien Didelot 2015-10-22  490  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  491  	seq_puts(s, " Port  FID\n"=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  492  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  493  	mutex_lock(&chip->reg_lock=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  494  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  495  	for (i =3D 0; i < mv88e6xx=
x_num_ports(chip); ++i) {
fe8a2a1725d821b Vivien Didelot 2015-10-22  496  		err =3D mv88e6xxx_port_ge=
t_fid(chip, i, &fid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  497  		if (err)
fe8a2a1725d821b Vivien Didelot 2015-10-22  498  			break;
fe8a2a1725d821b Vivien Didelot 2015-10-22  499  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  500  		seq_printf(s, "%4d  %d\n"=
, i, fid);
fe8a2a1725d821b Vivien Didelot 2015-10-22  501  	}
fe8a2a1725d821b Vivien Didelot 2015-10-22  502  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  503  	mutex_unlock(&chip->reg_lo=
ck);
fe8a2a1725d821b Vivien Didelot 2015-10-22  504  =

fe8a2a1725d821b Vivien Didelot 2015-10-22 @505  	return err;
fe8a2a1725d821b Vivien Didelot 2015-10-22  506  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  507  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  508  static int mv88e6xxx_fid_op=
en(struct inode *inode, struct file *file)
fe8a2a1725d821b Vivien Didelot 2015-10-22  509  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  510  	return single_open(file, m=
v88e6xxx_fid_show, inode->i_private);
fe8a2a1725d821b Vivien Didelot 2015-10-22  511  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  512  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  513  static const struct file_op=
erations mv88e6xxx_fid_fops =3D {
fe8a2a1725d821b Vivien Didelot 2015-10-22  514  	.open		=3D mv88e6xxx_fid_o=
pen,
fe8a2a1725d821b Vivien Didelot 2015-10-22  515  	.read		=3D seq_read,
fe8a2a1725d821b Vivien Didelot 2015-10-22  516  	.llseek		=3D no_llseek,
fe8a2a1725d821b Vivien Didelot 2015-10-22  517  	.release	=3D single_releas=
e,
fe8a2a1725d821b Vivien Didelot 2015-10-22  518  	.owner		=3D THIS_MODULE,
fe8a2a1725d821b Vivien Didelot 2015-10-22  519  };
fe8a2a1725d821b Vivien Didelot 2015-10-22  520  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  521  static const char * const m=
v88e6xxx_port_state_names[] =3D {
fe8a2a1725d821b Vivien Didelot 2015-10-22  522  	[MV88E6XXX_PORT_CTL0_STATE=
_DISABLED] =3D "Disabled",
fe8a2a1725d821b Vivien Didelot 2015-10-22  523  	[MV88E6XXX_PORT_CTL0_STATE=
_BLOCKING] =3D "Blocking/Listening",
fe8a2a1725d821b Vivien Didelot 2015-10-22  524  	[MV88E6XXX_PORT_CTL0_STATE=
_LEARNING] =3D "Learning",
fe8a2a1725d821b Vivien Didelot 2015-10-22  525  	[MV88E6XXX_PORT_CTL0_STATE=
_FORWARDING] =3D "Forwarding",
fe8a2a1725d821b Vivien Didelot 2015-10-22  526  };
fe8a2a1725d821b Vivien Didelot 2015-10-22  527  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  528  static int mv88e6xxx_state_=
show(struct seq_file *s, void *p)
fe8a2a1725d821b Vivien Didelot 2015-10-22  529  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  530  	struct mv88e6xxx_chip *chi=
p =3D s->private;
fe8a2a1725d821b Vivien Didelot 2015-10-22  531  	int i, ret;
fe8a2a1725d821b Vivien Didelot 2015-10-22  532  	u16 data;
fe8a2a1725d821b Vivien Didelot 2015-10-22  533  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  534  	/* header */
fe8a2a1725d821b Vivien Didelot 2015-10-22  535  	seq_puts(s, " Port  Mode\n=
");
fe8a2a1725d821b Vivien Didelot 2015-10-22  536  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  537  	mutex_lock(&chip->reg_lock=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  538  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  539  	/* One line per input port=
 */
fe8a2a1725d821b Vivien Didelot 2015-10-22  540  	for (i =3D 0; i < mv88e6xx=
x_num_ports(chip); ++i) {
fe8a2a1725d821b Vivien Didelot 2015-10-22  541  		seq_printf(s, "%4d ", i);
fe8a2a1725d821b Vivien Didelot 2015-10-22  542  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  543  		ret =3D mv88e6xxx_port_re=
ad(chip, i, MV88E6XXX_PORT_CTL0, &data);
fe8a2a1725d821b Vivien Didelot 2015-10-22  544  		if (ret < 0)
fe8a2a1725d821b Vivien Didelot 2015-10-22  545  			goto unlock;
fe8a2a1725d821b Vivien Didelot 2015-10-22  546  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  547  		data &=3D MV88E6XXX_PORT_=
CTL0_STATE_MASK;
fe8a2a1725d821b Vivien Didelot 2015-10-22  548  		seq_printf(s, " %s\n", mv=
88e6xxx_port_state_names[data]);
fe8a2a1725d821b Vivien Didelot 2015-10-22  549  		ret =3D 0;
fe8a2a1725d821b Vivien Didelot 2015-10-22  550  	}
fe8a2a1725d821b Vivien Didelot 2015-10-22  551  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  552  unlock:
fe8a2a1725d821b Vivien Didelot 2015-10-22  553  	mutex_unlock(&chip->reg_lo=
ck);
fe8a2a1725d821b Vivien Didelot 2015-10-22  554  =

fe8a2a1725d821b Vivien Didelot 2015-10-22 @555  	return ret;
fe8a2a1725d821b Vivien Didelot 2015-10-22  556  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  557  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  558  static int mv88e6xxx_state_=
open(struct inode *inode, struct file *file)
fe8a2a1725d821b Vivien Didelot 2015-10-22  559  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  560  	return single_open(file, m=
v88e6xxx_state_show, inode->i_private);
fe8a2a1725d821b Vivien Didelot 2015-10-22  561  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  562  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  563  static const struct file_op=
erations mv88e6xxx_state_fops =3D {
fe8a2a1725d821b Vivien Didelot 2015-10-22  564  	.open		=3D mv88e6xxx_state=
_open,
fe8a2a1725d821b Vivien Didelot 2015-10-22  565  	.read		=3D seq_read,
fe8a2a1725d821b Vivien Didelot 2015-10-22  566  	.llseek		=3D no_llseek,
fe8a2a1725d821b Vivien Didelot 2015-10-22  567  	.release	=3D single_releas=
e,
fe8a2a1725d821b Vivien Didelot 2015-10-22  568  	.owner		=3D THIS_MODULE,
fe8a2a1725d821b Vivien Didelot 2015-10-22  569  };
fe8a2a1725d821b Vivien Didelot 2015-10-22  570  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  571  static const char * const m=
v88e6xxx_port_8021q_mode_names[] =3D {
fe8a2a1725d821b Vivien Didelot 2015-10-22  572  	[MV88E6XXX_PORT_CTL2_8021Q=
_MODE_DISABLED] =3D "Disabled",
fe8a2a1725d821b Vivien Didelot 2015-10-22  573  	[MV88E6XXX_PORT_CTL2_8021Q=
_MODE_FALLBACK] =3D "Fallback",
fe8a2a1725d821b Vivien Didelot 2015-10-22  574  	[MV88E6XXX_PORT_CTL2_8021Q=
_MODE_CHECK] =3D "Check",
fe8a2a1725d821b Vivien Didelot 2015-10-22  575  	[MV88E6XXX_PORT_CTL2_8021Q=
_MODE_SECURE] =3D "Secure",
fe8a2a1725d821b Vivien Didelot 2015-10-22  576  };
fe8a2a1725d821b Vivien Didelot 2015-10-22  577  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  578  static int mv88e6xxx_8021q_=
mode_show(struct seq_file *s, void *p)
fe8a2a1725d821b Vivien Didelot 2015-10-22  579  {
fe8a2a1725d821b Vivien Didelot 2015-10-22  580  	struct mv88e6xxx_chip *chi=
p =3D s->private;
fe8a2a1725d821b Vivien Didelot 2015-10-22  581  	int i, ret;
fe8a2a1725d821b Vivien Didelot 2015-10-22  582  	u16 data;
fe8a2a1725d821b Vivien Didelot 2015-10-22  583  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  584  	/* header */
fe8a2a1725d821b Vivien Didelot 2015-10-22  585  	seq_puts(s, " Port  Mode\n=
");
fe8a2a1725d821b Vivien Didelot 2015-10-22  586  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  587  	mutex_lock(&chip->reg_lock=
);
fe8a2a1725d821b Vivien Didelot 2015-10-22  588  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  589  	/* One line per input port=
 */
fe8a2a1725d821b Vivien Didelot 2015-10-22  590  	for (i =3D 0; i < mv88e6xx=
x_num_ports(chip); ++i) {
fe8a2a1725d821b Vivien Didelot 2015-10-22  591  		seq_printf(s, "%4d ", i);
fe8a2a1725d821b Vivien Didelot 2015-10-22  592  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  593  		ret =3D mv88e6xxx_port_re=
ad(chip, i, MV88E6XXX_PORT_CTL2, &data);
fe8a2a1725d821b Vivien Didelot 2015-10-22  594  		if (ret < 0)
fe8a2a1725d821b Vivien Didelot 2015-10-22  595  			goto unlock;
fe8a2a1725d821b Vivien Didelot 2015-10-22  596  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  597  		data &=3D MV88E6XXX_PORT_=
CTL2_8021Q_MODE_MASK;
fe8a2a1725d821b Vivien Didelot 2015-10-22  598  		seq_printf(s, " %s\n", mv=
88e6xxx_port_8021q_mode_names[data]);
fe8a2a1725d821b Vivien Didelot 2015-10-22  599  		ret =3D 0;
fe8a2a1725d821b Vivien Didelot 2015-10-22  600  	}
fe8a2a1725d821b Vivien Didelot 2015-10-22  601  =

fe8a2a1725d821b Vivien Didelot 2015-10-22  602  unlock:
fe8a2a1725d821b Vivien Didelot 2015-10-22  603  	mutex_unlock(&chip->reg_lo=
ck);
fe8a2a1725d821b Vivien Didelot 2015-10-22  604  =

fe8a2a1725d821b Vivien Didelot 2015-10-22 @605  	return ret;
fe8a2a1725d821b Vivien Didelot 2015-10-22  606  }
fe8a2a1725d821b Vivien Didelot 2015-10-22  607  =


:::::: The code at line 441 was first introduced by commit
:::::: fe8a2a1725d821bb81755cefe6483985aee89fba net: dsa: mv88e6xxx: add de=
bugfs interface

:::::: TO: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1025828111437803268==--

