Content-Type: multipart/mixed; boundary="===============8680768613531039777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mtd:spi-nor/next 16/18] drivers/mtd/spi-nor/debugfs.c:84 spi_nor_params_show() warn: '%ph' cannot be followed by 'n'
Date: Wed, 11 May 2022 03:10:40 +0800
Message-ID: <202205110320.WNi7ZQaB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8680768613531039777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Michael Walle <michael@walle.cc>
CC: Pratyush Yadav <p.yadav@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-n=
or/next
head:   cdbc44dbb2c73d8bafa1a8ae0d780608be5dbd40
commit: 0257be79fc4a16a3252ce80aa13b3640f728c425 [16/18] mtd: spi-nor: expo=
se internal parameters via debugfs
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220511/202205110320.WNi7ZQaB-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/spi-nor/debugfs.c:84 spi_nor_params_show() warn: '%ph' cannot b=
e followed by 'n'

vim +84 drivers/mtd/spi-nor/debugfs.c

0257be79fc4a16 Michael Walle 2022-04-29   72  =

0257be79fc4a16 Michael Walle 2022-04-29   73  static int spi_nor_params_sho=
w(struct seq_file *s, void *data)
0257be79fc4a16 Michael Walle 2022-04-29   74  {
0257be79fc4a16 Michael Walle 2022-04-29   75  	struct spi_nor *nor =3D s->p=
rivate;
0257be79fc4a16 Michael Walle 2022-04-29   76  	struct spi_nor_flash_paramet=
er *params =3D nor->params;
0257be79fc4a16 Michael Walle 2022-04-29   77  	struct spi_nor_erase_map *er=
ase_map =3D &params->erase_map;
0257be79fc4a16 Michael Walle 2022-04-29   78  	struct spi_nor_erase_region =
*region;
0257be79fc4a16 Michael Walle 2022-04-29   79  	const struct flash_info *inf=
o =3D nor->info;
0257be79fc4a16 Michael Walle 2022-04-29   80  	char buf[16], *str;
0257be79fc4a16 Michael Walle 2022-04-29   81  	int i;
0257be79fc4a16 Michael Walle 2022-04-29   82  =

0257be79fc4a16 Michael Walle 2022-04-29   83  	seq_printf(s, "name\t\t%s\n"=
, info->name);
0257be79fc4a16 Michael Walle 2022-04-29  @84  	seq_printf(s, "id\t\t%*phn\n=
", info->id_len, info->id);
0257be79fc4a16 Michael Walle 2022-04-29   85  	string_get_size(params->size=
, 1, STRING_UNITS_2, buf, sizeof(buf));
0257be79fc4a16 Michael Walle 2022-04-29   86  	seq_printf(s, "size\t\t%s\n"=
, buf);
0257be79fc4a16 Michael Walle 2022-04-29   87  	seq_printf(s, "write size\t%=
u\n", params->writesize);
0257be79fc4a16 Michael Walle 2022-04-29   88  	seq_printf(s, "page size\t%u=
\n", params->page_size);
0257be79fc4a16 Michael Walle 2022-04-29   89  	seq_printf(s, "address width=
\t%u\n", nor->addr_width);
0257be79fc4a16 Michael Walle 2022-04-29   90  =

0257be79fc4a16 Michael Walle 2022-04-29   91  	seq_puts(s, "flags\t\t");
0257be79fc4a16 Michael Walle 2022-04-29   92  	spi_nor_print_flags(s, nor->=
flags, snor_f_names, sizeof(snor_f_names));
0257be79fc4a16 Michael Walle 2022-04-29   93  	seq_puts(s, "\n");
0257be79fc4a16 Michael Walle 2022-04-29   94  =

0257be79fc4a16 Michael Walle 2022-04-29   95  	seq_puts(s, "\nopcodes\n");
0257be79fc4a16 Michael Walle 2022-04-29   96  	seq_printf(s, " read\t\t0x%0=
2x\n", nor->read_opcode);
0257be79fc4a16 Michael Walle 2022-04-29   97  	seq_printf(s, "  dummy cycle=
s\t%u\n", nor->read_dummy);
0257be79fc4a16 Michael Walle 2022-04-29   98  	seq_printf(s, " erase\t\t0x%=
02x\n", nor->erase_opcode);
0257be79fc4a16 Michael Walle 2022-04-29   99  	seq_printf(s, " program\t0x%=
02x\n", nor->program_opcode);
0257be79fc4a16 Michael Walle 2022-04-29  100  =

0257be79fc4a16 Michael Walle 2022-04-29  101  	switch (nor->cmd_ext_type) {
0257be79fc4a16 Michael Walle 2022-04-29  102  	case SPI_NOR_EXT_NONE:
0257be79fc4a16 Michael Walle 2022-04-29  103  		str =3D "none";
0257be79fc4a16 Michael Walle 2022-04-29  104  		break;
0257be79fc4a16 Michael Walle 2022-04-29  105  	case SPI_NOR_EXT_REPEAT:
0257be79fc4a16 Michael Walle 2022-04-29  106  		str =3D "repeat";
0257be79fc4a16 Michael Walle 2022-04-29  107  		break;
0257be79fc4a16 Michael Walle 2022-04-29  108  	case SPI_NOR_EXT_INVERT:
0257be79fc4a16 Michael Walle 2022-04-29  109  		str =3D "invert";
0257be79fc4a16 Michael Walle 2022-04-29  110  		break;
0257be79fc4a16 Michael Walle 2022-04-29  111  	default:
0257be79fc4a16 Michael Walle 2022-04-29  112  		str =3D "<unknown>";
0257be79fc4a16 Michael Walle 2022-04-29  113  		break;
0257be79fc4a16 Michael Walle 2022-04-29  114  	}
0257be79fc4a16 Michael Walle 2022-04-29  115  	seq_printf(s, " 8D extension=
\t%s\n", str);
0257be79fc4a16 Michael Walle 2022-04-29  116  =

0257be79fc4a16 Michael Walle 2022-04-29  117  	seq_puts(s, "\nprotocols\n");
0257be79fc4a16 Michael Walle 2022-04-29  118  	seq_printf(s, " read\t\t%s\n=
",
0257be79fc4a16 Michael Walle 2022-04-29  119  		   spi_nor_protocol_name(no=
r->read_proto));
0257be79fc4a16 Michael Walle 2022-04-29  120  	seq_printf(s, " write\t\t%s\=
n",
0257be79fc4a16 Michael Walle 2022-04-29  121  		   spi_nor_protocol_name(no=
r->write_proto));
0257be79fc4a16 Michael Walle 2022-04-29  122  	seq_printf(s, " register\t%s=
\n",
0257be79fc4a16 Michael Walle 2022-04-29  123  		   spi_nor_protocol_name(no=
r->reg_proto));
0257be79fc4a16 Michael Walle 2022-04-29  124  =

0257be79fc4a16 Michael Walle 2022-04-29  125  	seq_puts(s, "\nerase command=
s\n");
0257be79fc4a16 Michael Walle 2022-04-29  126  	for (i =3D 0; i < SNOR_ERASE=
_TYPE_MAX; i++) {
0257be79fc4a16 Michael Walle 2022-04-29  127  		struct spi_nor_erase_type *=
et =3D &erase_map->erase_type[i];
0257be79fc4a16 Michael Walle 2022-04-29  128  =

0257be79fc4a16 Michael Walle 2022-04-29  129  		if (et->size) {
0257be79fc4a16 Michael Walle 2022-04-29  130  			string_get_size(et->size, =
1, STRING_UNITS_2, buf,
0257be79fc4a16 Michael Walle 2022-04-29  131  					sizeof(buf));
0257be79fc4a16 Michael Walle 2022-04-29  132  			seq_printf(s, " %02x (%s) =
[%d]\n", et->opcode, buf, i);
0257be79fc4a16 Michael Walle 2022-04-29  133  		}
0257be79fc4a16 Michael Walle 2022-04-29  134  	}
0257be79fc4a16 Michael Walle 2022-04-29  135  =

0257be79fc4a16 Michael Walle 2022-04-29  136  	if (!(nor->flags & SNOR_F_NO=
_OP_CHIP_ERASE)) {
0257be79fc4a16 Michael Walle 2022-04-29  137  		string_get_size(params->siz=
e, 1, STRING_UNITS_2, buf, sizeof(buf));
0257be79fc4a16 Michael Walle 2022-04-29  138  		seq_printf(s, " %02x (%s)\n=
", SPINOR_OP_CHIP_ERASE, buf);
0257be79fc4a16 Michael Walle 2022-04-29  139  	}
0257be79fc4a16 Michael Walle 2022-04-29  140  =

0257be79fc4a16 Michael Walle 2022-04-29  141  	seq_puts(s, "\nsector map\n"=
);
0257be79fc4a16 Michael Walle 2022-04-29  142  	seq_puts(s, " region (in hex=
)   | erase mask | flags\n");
0257be79fc4a16 Michael Walle 2022-04-29  143  	seq_puts(s, " --------------=
----+------------+----------\n");
0257be79fc4a16 Michael Walle 2022-04-29  144  	for (region =3D erase_map->r=
egions;
0257be79fc4a16 Michael Walle 2022-04-29  145  	     region;
0257be79fc4a16 Michael Walle 2022-04-29  146  	     region =3D spi_nor_regi=
on_next(region)) {
0257be79fc4a16 Michael Walle 2022-04-29  147  		u64 start =3D region->offse=
t & ~SNOR_ERASE_FLAGS_MASK;
0257be79fc4a16 Michael Walle 2022-04-29  148  		u64 flags =3D region->offse=
t & SNOR_ERASE_FLAGS_MASK;
0257be79fc4a16 Michael Walle 2022-04-29  149  		u64 end =3D start + region-=
>size - 1;
0257be79fc4a16 Michael Walle 2022-04-29  150  =

0257be79fc4a16 Michael Walle 2022-04-29  151  		seq_printf(s, " %08llx-%08l=
lx |     [%c%c%c%c] | %s\n",
0257be79fc4a16 Michael Walle 2022-04-29  152  			   start, end,
0257be79fc4a16 Michael Walle 2022-04-29  153  			   flags & BIT(0) ? '0' : =
' ',
0257be79fc4a16 Michael Walle 2022-04-29  154  			   flags & BIT(1) ? '1' : =
' ',
0257be79fc4a16 Michael Walle 2022-04-29  155  			   flags & BIT(2) ? '2' : =
' ',
0257be79fc4a16 Michael Walle 2022-04-29  156  			   flags & BIT(3) ? '3' : =
' ',
0257be79fc4a16 Michael Walle 2022-04-29  157  			   flags & SNOR_OVERLAID_R=
EGION ? "overlaid" : "");
0257be79fc4a16 Michael Walle 2022-04-29  158  	}
0257be79fc4a16 Michael Walle 2022-04-29  159  =

0257be79fc4a16 Michael Walle 2022-04-29  160  	return 0;
0257be79fc4a16 Michael Walle 2022-04-29  161  }
0257be79fc4a16 Michael Walle 2022-04-29  162  DEFINE_SHOW_ATTRIBUTE(spi_nor=
_params);
0257be79fc4a16 Michael Walle 2022-04-29  163  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8680768613531039777==--

