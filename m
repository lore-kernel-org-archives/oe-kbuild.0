Content-Type: multipart/mixed; boundary="===============2510709361282976830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hch-misc:remove-scsi_request 4/8] drivers/scsi/scsi_logging.c:90 scmd_printk() warn: this array is probably non-NULL. 'scmd->cmnd'
Date: Sat, 12 Feb 2022 01:57:25 +0800
Message-ID: <202202112045.bMpV3jhe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2510709361282976830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git remove-scsi_request
head:   d8fd889c4c1f73165ec38da54e2c10bfe795686b
commit: 17cfefd0e27007b007c4650e76537805abfe18ed [4/8] scsi: remove the cmd=
 field from struct scsi_request
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-m031-20220211 (https://download.01.org/0day-ci/arc=
hive/20220211/202202112045.bMpV3jhe-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/scsi/scsi_logging.c:90 scmd_printk() warn: this array is probably n=
on-NULL. 'scmd->cmnd'
drivers/scsi/scsi_logging.c:186 scsi_print_command() warn: this array is pr=
obably non-NULL. 'cmd->cmnd'

vim +90 drivers/scsi/scsi_logging.c

ded85c193a391a8 Hannes Reinecke   2015-01-08   82  =

9c4a6b1e4280134 Hannes Reinecke   2015-02-04   83  void scmd_printk(const c=
har *level, const struct scsi_cmnd *scmd,
ded85c193a391a8 Hannes Reinecke   2015-01-08   84  		const char *fmt, ...)
ded85c193a391a8 Hannes Reinecke   2015-01-08   85  {
ded85c193a391a8 Hannes Reinecke   2015-01-08   86  	va_list args;
ded85c193a391a8 Hannes Reinecke   2015-01-08   87  	char *logbuf;
ded85c193a391a8 Hannes Reinecke   2015-01-08   88  	size_t off =3D 0, logbu=
f_len;
ded85c193a391a8 Hannes Reinecke   2015-01-08   89  =

ded85c193a391a8 Hannes Reinecke   2015-01-08  @90  	if (!scmd || !scmd->cmn=
d)
9c4a6b1e4280134 Hannes Reinecke   2015-02-04   91  		return;
ded85c193a391a8 Hannes Reinecke   2015-01-08   92  =

ded85c193a391a8 Hannes Reinecke   2015-01-08   93  	logbuf =3D scsi_log_res=
erve_buffer(&logbuf_len);
ded85c193a391a8 Hannes Reinecke   2015-01-08   94  	if (!logbuf)
9c4a6b1e4280134 Hannes Reinecke   2015-02-04   95  		return;
2104551969e8011 Hannes Reinecke   2015-01-08   96  	off =3D sdev_format_hea=
der(logbuf, logbuf_len, scmd_name(scmd),
aa8e25e5006aac5 Bart Van Assche   2021-08-09   97  				 scsi_cmd_to_rq((str=
uct scsi_cmnd *)scmd)->tag);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08   98  	if (off < logbuf_len) {
ded85c193a391a8 Hannes Reinecke   2015-01-08   99  		va_start(args, fmt);
ded85c193a391a8 Hannes Reinecke   2015-01-08  100  		off +=3D vscnprintf(lo=
gbuf + off, logbuf_len - off, fmt, args);
ded85c193a391a8 Hannes Reinecke   2015-01-08  101  		va_end(args);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  102  	}
9c4a6b1e4280134 Hannes Reinecke   2015-02-04  103  	dev_printk(level, &scmd=
->device->sdev_gendev, "%s", logbuf);
ded85c193a391a8 Hannes Reinecke   2015-01-08  104  	scsi_log_release_buffer=
(logbuf);
ded85c193a391a8 Hannes Reinecke   2015-01-08  105  }
ded85c193a391a8 Hannes Reinecke   2015-01-08  106  EXPORT_SYMBOL(scmd_print=
k);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  107  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  108  static size_t scsi_forma=
t_opcode_name(char *buffer, size_t buf_len,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  109  				      const unsigned=
 char *cdbp)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  110  {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  111  	int sa, cdb0;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  112  	const char *cdb_name =
=3D NULL, *sa_name =3D NULL;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  113  	size_t off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  114  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  115  	cdb0 =3D cdbp[0];
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  116  	if (cdb0 =3D=3D VARIABL=
E_LENGTH_CMD) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  117  		int len =3D scsi_varle=
n_cdb_length(cdbp);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  118  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  119  		if (len < 10) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  120  			off =3D scnprintf(buf=
fer, buf_len,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  121  					"short variable len=
gth command, len=3D%d",
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  122  					len);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  123  			return off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  124  		}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  125  		sa =3D (cdbp[8] << 8) =
+ cdbp[9];
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  126  	} else
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  127  		sa =3D cdbp[1] & 0x1f;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  128  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  129  	if (!scsi_opcode_sa_nam=
e(cdb0, sa, &cdb_name, &sa_name)) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  130  		if (cdb_name)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  131  			off =3D scnprintf(buf=
fer, buf_len, "%s", cdb_name);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  132  		else {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  133  			off =3D scnprintf(buf=
fer, buf_len, "opcode=3D0x%x", cdb0);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  134  			if (WARN_ON(off >=3D =
buf_len))
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  135  				return off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  136  			if (cdb0 >=3D VENDOR_=
SPECIFIC_CDB)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  137  				off +=3D scnprintf(b=
uffer + off, buf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  138  						 " (vendor)");
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  139  			else if (cdb0 >=3D 0x=
60 && cdb0 < 0x7e)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  140  				off +=3D scnprintf(b=
uffer + off, buf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  141  						 " (reserved)");
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  142  		}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  143  	} else {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  144  		if (sa_name)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  145  			off =3D scnprintf(buf=
fer, buf_len, "%s", sa_name);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  146  		else if (cdb_name)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  147  			off =3D scnprintf(buf=
fer, buf_len, "%s, sa=3D0x%x",
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  148  					cdb_name, sa);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  149  		else
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  150  			off =3D scnprintf(buf=
fer, buf_len,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  151  					"opcode=3D0x%x, sa=
=3D0x%x", cdb0, sa);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  152  	}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  153  	WARN_ON(off >=3D buf_le=
n);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  154  	return off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  155  }
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  156  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  157  size_t __scsi_format_com=
mand(char *logbuf, size_t logbuf_len,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  158  			     const unsigned c=
har *cdb, size_t cdb_len)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  159  {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  160  	int len, k;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  161  	size_t off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  162  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  163  	off =3D scsi_format_opc=
ode_name(logbuf, logbuf_len, cdb);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  164  	if (off >=3D logbuf_len)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  165  		return off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  166  	len =3D scsi_command_si=
ze(cdb);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  167  	if (cdb_len < len)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  168  		len =3D cdb_len;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  169  	/* print out all bytes =
in cdb */
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  170  	for (k =3D 0; k < len; =
++k) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  171  		if (off > logbuf_len -=
 3)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  172  			break;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  173  		off +=3D scnprintf(log=
buf + off, logbuf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  174  				 " %02x", cdb[k]);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  175  	}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  176  	return off;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  177  }
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  178  EXPORT_SYMBOL(__scsi_for=
mat_command);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  179  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  180  void scsi_print_command(=
struct scsi_cmnd *cmd)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  181  {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  182  	int k;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  183  	char *logbuf;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  184  	size_t off, logbuf_len;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  185  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08 @186  	if (!cmd->cmnd)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  187  		return;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  188  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  189  	logbuf =3D scsi_log_res=
erve_buffer(&logbuf_len);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  190  	if (!logbuf)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  191  		return;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  192  =

2104551969e8011 Hannes Reinecke   2015-01-08  193  	off =3D sdev_format_hea=
der(logbuf, logbuf_len,
aa8e25e5006aac5 Bart Van Assche   2021-08-09  194  				 scmd_name(cmd), scs=
i_cmd_to_rq(cmd)->tag);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  195  	if (off >=3D logbuf_len)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  196  		goto out_printk;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  197  	off +=3D scnprintf(logb=
uf + off, logbuf_len - off, "CDB: ");
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  198  	if (WARN_ON(off >=3D lo=
gbuf_len))
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  199  		goto out_printk;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  200  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  201  	off +=3D scsi_format_op=
code_name(logbuf + off, logbuf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  202  				       cmd->cmnd);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  203  	if (off >=3D logbuf_len)
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  204  		goto out_printk;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  205  =

9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  206  	/* print out all bytes =
in cdb */
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  207  	if (cmd->cmd_len > 16) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  208  		/* Print opcode in one=
 line and use separate lines for CDB */
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  209  		off +=3D scnprintf(log=
buf + off, logbuf_len - off, "\n");
2fc583c4628bf78 Christoph Hellwig 2015-01-18  210  		dev_printk(KERN_INFO, =
&cmd->device->sdev_gendev, "%s", logbuf);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  211  		for (k =3D 0; k < cmd-=
>cmd_len; k +=3D 16) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  212  			size_t linelen =3D mi=
n(cmd->cmd_len - k, 16);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  213  =

2104551969e8011 Hannes Reinecke   2015-01-08  214  			off =3D sdev_format_h=
eader(logbuf, logbuf_len,
2104551969e8011 Hannes Reinecke   2015-01-08  215  						 scmd_name(cmd),
aa8e25e5006aac5 Bart Van Assche   2021-08-09  216  						 scsi_cmd_to_rq(cm=
d)->tag);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  217  			if (!WARN_ON(off > lo=
gbuf_len - 58)) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  218  				off +=3D scnprintf(l=
ogbuf + off, logbuf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  219  						 "CDB[%02x]: ", k);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  220  				hex_dump_to_buffer(&=
cmd->cmnd[k], linelen,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  221  						   16, 1, logbuf +=
 off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  222  						   logbuf_len - of=
f, false);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  223  			}
2fc583c4628bf78 Christoph Hellwig 2015-01-18  224  			dev_printk(KERN_INFO,=
 &cmd->device->sdev_gendev, "%s",
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  225  				   logbuf);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  226  		}
811f39479c0c2d4 Ye Bin            2020-07-17  227  		goto out;
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  228  	}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  229  	if (!WARN_ON(off > logb=
uf_len - 49)) {
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  230  		off +=3D scnprintf(log=
buf + off, logbuf_len - off, " ");
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  231  		hex_dump_to_buffer(cmd=
->cmnd, cmd->cmd_len, 16, 1,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  232  				   logbuf + off, log=
buf_len - off,
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  233  				   false);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  234  	}
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  235  out_printk:
2fc583c4628bf78 Christoph Hellwig 2015-01-18  236  	dev_printk(KERN_INFO, &=
cmd->device->sdev_gendev, "%s", logbuf);
811f39479c0c2d4 Ye Bin            2020-07-17  237  out:
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  238  	scsi_log_release_buffer=
(logbuf);
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  239  }
9e5ed2a5b3662c6 Hannes Reinecke   2015-01-08  240  EXPORT_SYMBOL(scsi_print=
_command);
2104551969e8011 Hannes Reinecke   2015-01-08  241  =


:::::: The code at line 90 was first introduced by commit
:::::: ded85c193a391a84076d5c6a7a5668fe164a490e scsi: Implement per-cpu log=
ging buffer

:::::: TO: Hannes Reinecke <hare@suse.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2510709361282976830==--

