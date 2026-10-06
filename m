Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC2547063
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 00:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791247390; cv=none; b=ZC/VS4M1lZqVtwRko/5nmNOVihypWQMa5ujeqFS+dpxZii4Htn0GP3iROAs45vijm3/fR1/f1dzTOj01p4oxThHpJEaddNXVLvym0r+bz+bFTaxQ5jwboGcjw7ySLknA4xVU+5rZ8LHPZTroYaNaOjcjxUtwIfnw1372Q37K2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791247390; c=relaxed/simple;
	bh=ZQdyb4JJn9LIWBm6jZew+oT0iT7o8TE1iCCPbfdHKRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KT2EzXDkwOjvnlp59T4/yJLmO7Sw4BqD+IIQ3VdW8JP5fzLkIbcsf7W0FrBUTAkUmRS0sooL/SXx2lAWoMOx0BNY4q8hm2rTqMtwSPfC6HYKPda4m+jSz86I6YcYEC7Ufl9UpWoMOK60BQrdAjbL2wTZqKm0HGF3n8Vd9ASraLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Noanj8ri; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Noanj8ri"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791247388; x=1822783388;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZQdyb4JJn9LIWBm6jZew+oT0iT7o8TE1iCCPbfdHKRc=;
  b=Noanj8rizSSC/0Ci3OgFs+dqMXurGXWu/xW+tHU7IbQdd03ZRPKfzhbX
   a+zghfKgWxWQxKTzY9CChDq4VfLTV9qjVWjvKlsHuVqBzqju6cIKpbIAm
   XCnjMUk45jXOU38LYy4jYpdjY9KFQjxQn11UdnsGAe4ENi9hMy7Ejfgbn
   V0XCIJxUWyD3Q4EbXEUiIEo6/qxLBE2aMezwGFTSh947k6vCLyyBNVDS5
   9qBSH9rIrU38av9DwuVRsoS7ntfNn6lVCOfr5IL3d79RyVGhWQW4hXLyk
   s0pen1teJBQwE2/L4jf+Nb9zYDCZxhlZbvH81+C9UkJQXBgV+XForiTBh
   w==;
X-CSE-ConnectionGUID: X3BTY82ZQ02fc9jSRU2d+g==
X-CSE-MsgGUID: 1PEQ1391SvWRiIKidnFHGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94805423"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94805423"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 17:43:07 -0700
X-CSE-ConnectionGUID: XGawqWrjTmagvi7qPD9Vaw==
X-CSE-MsgGUID: 8eGRgcs0TieN+FfOUV9Blw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277092376"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 05 Oct 2026 17:43:06 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDtGp-000000000VL-489d;
	Tue, 06 Oct 2026 00:43:03 +0000
Date: Tue, 06 Oct 2026 02:43:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: 
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:287:18-19: WARNING
 opportunity for min()
Message-ID: <202610060206.mtl7lOeY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Muhammad Bilal <meatuni001@gmail.com>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   67f0943b394d920b6c142aad8c6af94340342ae7
commit: 05c808362e808e196f75696b8a64f7aa8b2245ce platform/x86: hp-bioscfg: =
advance elem past consumed array elements
date:   7 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-2103-20261005 (https://download.01.org/0day-ci/arch=
ive/20261006/202610060206.mtl7lOeY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 05c808362e80 ("platform/x86: hp-bioscfg: advance elem past consume=
d array elements")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610060206.mtl7lOeY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c:287:18-19: WARNING =
opportunity for min()

vim +287 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c

6b2770bfd6f924 Jorge Lopez     2023-06-08  125 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  126  static int hp_populate_enum=
eration_elements_from_package(union acpi_object *enum_obj,
6b2770bfd6f924 Jorge Lopez     2023-06-08  127  							 int enum_obj_count,
6b2770bfd6f924 Jorge Lopez     2023-06-08  128  							 int instance_id)
6b2770bfd6f924 Jorge Lopez     2023-06-08  129  {
6b2770bfd6f924 Jorge Lopez     2023-06-08  130  	char *str_value =3D NULL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  131  	int value_len;
6b2770bfd6f924 Jorge Lopez     2023-06-08  132  	u32 size =3D 0;
80d7ba3020fdb6 Jorge Lopez     2023-07-31  133  	u32 int_value =3D 0;
6b2770bfd6f924 Jorge Lopez     2023-06-08  134  	int elem =3D 0;
6b2770bfd6f924 Jorge Lopez     2023-06-08  135  	int reqs;
6b2770bfd6f924 Jorge Lopez     2023-06-08  136  	int pos_values;
6b2770bfd6f924 Jorge Lopez     2023-06-08  137  	int ret;
6b2770bfd6f924 Jorge Lopez     2023-06-08  138  	int eloc;
6b2770bfd6f924 Jorge Lopez     2023-06-08  139  	struct enumeration_data *e=
num_data =3D &bioscfg_drv.enumeration_data[instance_id];
6b2770bfd6f924 Jorge Lopez     2023-06-08  140 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  141  	for (elem =3D 1, eloc =3D =
1; elem < enum_obj_count; elem++, eloc++) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  142  		/* ONLY look at the first=
 ENUM_ELEM_CNT elements */
6b2770bfd6f924 Jorge Lopez     2023-06-08  143  		if (eloc =3D=3D ENUM_ELEM=
_CNT)
6b2770bfd6f924 Jorge Lopez     2023-06-08  144  			goto exit_enumeration_pa=
ckage;
6b2770bfd6f924 Jorge Lopez     2023-06-08  145 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  146  		switch (enum_obj[elem].ty=
pe) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  147  		case ACPI_TYPE_STRING:
6b2770bfd6f924 Jorge Lopez     2023-06-08  148  			if (PREREQUISITES !=3D e=
lem && ENUM_POSSIBLE_VALUES !=3D elem) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  149  				ret =3D hp_convert_hexs=
tr_to_str(enum_obj[elem].string.pointer,
6b2770bfd6f924 Jorge Lopez     2023-06-08  150  							       enum_obj[elem=
].string.length,
6b2770bfd6f924 Jorge Lopez     2023-06-08  151  							       &str_value, &=
value_len);
6b2770bfd6f924 Jorge Lopez     2023-06-08  152  				if (ret)
6b2770bfd6f924 Jorge Lopez     2023-06-08  153  					return -EINVAL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  154  			}
6b2770bfd6f924 Jorge Lopez     2023-06-08  155  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  156  		case ACPI_TYPE_INTEGER:
6b2770bfd6f924 Jorge Lopez     2023-06-08  157  			int_value =3D (u32)enum_=
obj[elem].integer.value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  158  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  159  		default:
6b2770bfd6f924 Jorge Lopez     2023-06-08  160  			pr_warn("Unsupported obj=
ect type [%d]\n", enum_obj[elem].type);
6b2770bfd6f924 Jorge Lopez     2023-06-08  161  			continue;
6b2770bfd6f924 Jorge Lopez     2023-06-08  162  		}
6b2770bfd6f924 Jorge Lopez     2023-06-08  163 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  164  		/* Check that both expect=
ed and read object type match */
6b2770bfd6f924 Jorge Lopez     2023-06-08  165  		if (expected_enum_types[e=
loc] !=3D enum_obj[elem].type) {
b0e2af3ec94e04 Muhammad Bilal  2026-07-09  166  			pr_warn("Unexpected elem=
ent type at elem %d: expected %d, got %d, skipping\n",
b0e2af3ec94e04 Muhammad Bilal  2026-07-09  167  				elem, expected_enum_typ=
es[eloc], enum_obj[elem].type);
467d41638113b6 Jorge Lopez     2023-07-31  168  			kfree(str_value);
b0e2af3ec94e04 Muhammad Bilal  2026-07-09  169  			str_value =3D NULL;
b0e2af3ec94e04 Muhammad Bilal  2026-07-09  170  			continue;
6b2770bfd6f924 Jorge Lopez     2023-06-08  171  		}
6b2770bfd6f924 Jorge Lopez     2023-06-08  172 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  173  		/* Assign appropriate ele=
ment value to corresponding field */
6b2770bfd6f924 Jorge Lopez     2023-06-08  174  		switch (eloc) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  175  		case NAME:
6b2770bfd6f924 Jorge Lopez     2023-06-08  176  		case VALUE:
6b2770bfd6f924 Jorge Lopez     2023-06-08  177  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  178  		case PATH:
c5288cda69ee2d Andy Shevchenko 2024-06-02  179  			strscpy(enum_data->commo=
n.path, str_value);
6b2770bfd6f924 Jorge Lopez     2023-06-08  180  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  181  		case IS_READONLY:
6b2770bfd6f924 Jorge Lopez     2023-06-08  182  			enum_data->common.is_rea=
donly =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  183  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  184  		case DISPLAY_IN_UI:
6b2770bfd6f924 Jorge Lopez     2023-06-08  185  			enum_data->common.displa=
y_in_ui =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  186  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  187  		case REQUIRES_PHYSICAL_PR=
ESENCE:
6b2770bfd6f924 Jorge Lopez     2023-06-08  188  			enum_data->common.requir=
es_physical_presence =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  189  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  190  		case SEQUENCE:
6b2770bfd6f924 Jorge Lopez     2023-06-08  191  			enum_data->common.sequen=
ce =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  192  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  193  		case PREREQUISITES_SIZE:
08f1f212576c88 Jorge Lopez     2023-07-31  194  			if (int_value > MAX_PRER=
EQUISITES_SIZE) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  195  				pr_warn("Prerequisites =
size value exceeded the maximum number of elements supported or data may be=
 malformed\n");
08f1f212576c88 Jorge Lopez     2023-07-31  196  				int_value =3D MAX_PRERE=
QUISITES_SIZE;
08f1f212576c88 Jorge Lopez     2023-07-31  197  			}
08f1f212576c88 Jorge Lopez     2023-07-31  198  			enum_data->common.prereq=
uisites_size =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  199 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  200  			/*
a585400b36306c Jorge Lopez     2023-07-31  201  			 * This step is needed t=
o keep the expected
6b2770bfd6f924 Jorge Lopez     2023-06-08  202  			 * element list pointing=
 to the right obj[elem].type
6b2770bfd6f924 Jorge Lopez     2023-06-08  203  			 * when the size is zero=
. PREREQUISITES
6b2770bfd6f924 Jorge Lopez     2023-06-08  204  			 * object is omitted by =
BIOS when the size is
6b2770bfd6f924 Jorge Lopez     2023-06-08  205  			 * zero.
6b2770bfd6f924 Jorge Lopez     2023-06-08  206  			 */
6b2770bfd6f924 Jorge Lopez     2023-06-08  207  			if (int_value =3D=3D 0)
6b2770bfd6f924 Jorge Lopez     2023-06-08  208  				eloc++;
6b2770bfd6f924 Jorge Lopez     2023-06-08  209  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  210 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  211  		case PREREQUISITES:
6b2770bfd6f924 Jorge Lopez     2023-06-08  212  			size =3D min_t(u32, enum=
_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
6b2770bfd6f924 Jorge Lopez     2023-06-08  213  			for (reqs =3D 0; reqs < =
size; reqs++) {
e44c42c830b7ab Junrui Luo      2025-12-26  214  				if (elem + reqs >=3D en=
um_obj_count) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  215  					pr_err("Error enum-obj=
ects package is too small\n");
6b2770bfd6f924 Jorge Lopez     2023-06-08  216  					return -EINVAL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  217  				}
6b2770bfd6f924 Jorge Lopez     2023-06-08  218 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  219  				ret =3D hp_convert_hexs=
tr_to_str(enum_obj[elem + reqs].string.pointer,
6b2770bfd6f924 Jorge Lopez     2023-06-08  220  							       enum_obj[elem=
 + reqs].string.length,
6b2770bfd6f924 Jorge Lopez     2023-06-08  221  							       &str_value, &=
value_len);
6b2770bfd6f924 Jorge Lopez     2023-06-08  222 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  223  				if (ret)
6b2770bfd6f924 Jorge Lopez     2023-06-08  224  					return -EINVAL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  225 =20
c5288cda69ee2d Andy Shevchenko 2024-06-02  226  				strscpy(enum_data->comm=
on.prerequisites[reqs], str_value);
6b2770bfd6f924 Jorge Lopez     2023-06-08  227 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  228  				kfree(str_value);
467d41638113b6 Jorge Lopez     2023-07-31  229  				str_value =3D NULL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  230  			}
05c808362e808e Muhammad Bilal  2026-08-12  231  			if (size)
05c808362e808e Muhammad Bilal  2026-08-12  232  				elem +=3D size - 1;
6b2770bfd6f924 Jorge Lopez     2023-06-08  233  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  234 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  235  		case SECURITY_LEVEL:
6b2770bfd6f924 Jorge Lopez     2023-06-08  236  			enum_data->common.securi=
ty_level =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  237  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  238 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  239  		case ENUM_CURRENT_VALUE:
c5288cda69ee2d Andy Shevchenko 2024-06-02  240  			strscpy(enum_data->curre=
nt_value, str_value);
6b2770bfd6f924 Jorge Lopez     2023-06-08  241  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  242  		case ENUM_SIZE:
42efc9e65dfbfc Jorge Lopez     2023-07-31  243  			if (int_value > MAX_VALU=
ES_SIZE) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  244  				pr_warn("Possible numbe=
r values size value exceeded the maximum number of elements supported or da=
ta may be malformed\n");
42efc9e65dfbfc Jorge Lopez     2023-07-31  245  				int_value =3D MAX_VALUE=
S_SIZE;
42efc9e65dfbfc Jorge Lopez     2023-07-31  246  			}
42efc9e65dfbfc Jorge Lopez     2023-07-31  247  			enum_data->possible_valu=
es_size =3D int_value;
6b2770bfd6f924 Jorge Lopez     2023-06-08  248 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  249  			/*
a585400b36306c Jorge Lopez     2023-07-31  250  			 * This step is needed t=
o keep the expected
6b2770bfd6f924 Jorge Lopez     2023-06-08  251  			 * element list pointing=
 to the right obj[elem].type
6b2770bfd6f924 Jorge Lopez     2023-06-08  252  			 * when the size is zero=
. POSSIBLE_VALUES
6b2770bfd6f924 Jorge Lopez     2023-06-08  253  			 * object is omitted by =
BIOS when the size is zero.
6b2770bfd6f924 Jorge Lopez     2023-06-08  254  			 */
6b2770bfd6f924 Jorge Lopez     2023-06-08  255  			if (int_value =3D=3D 0)
6b2770bfd6f924 Jorge Lopez     2023-06-08  256  				eloc++;
6b2770bfd6f924 Jorge Lopez     2023-06-08  257  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  258 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  259  		case ENUM_POSSIBLE_VALUES:
6b2770bfd6f924 Jorge Lopez     2023-06-08  260  			size =3D enum_data->poss=
ible_values_size;
6b2770bfd6f924 Jorge Lopez     2023-06-08  261 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  262  			for (pos_values =3D 0; p=
os_values < size && pos_values < MAX_VALUES_SIZE;
6b2770bfd6f924 Jorge Lopez     2023-06-08  263  			     pos_values++) {
e44c42c830b7ab Junrui Luo      2025-12-26  264  				if (elem + pos_values >=
=3D enum_obj_count) {
6b2770bfd6f924 Jorge Lopez     2023-06-08  265  					pr_err("Error enum-obj=
ects package is too small\n");
6b2770bfd6f924 Jorge Lopez     2023-06-08  266  					return -EINVAL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  267  				}
6b2770bfd6f924 Jorge Lopez     2023-06-08  268 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  269  				ret =3D hp_convert_hexs=
tr_to_str(enum_obj[elem + pos_values].string.pointer,
6b2770bfd6f924 Jorge Lopez     2023-06-08  270  							       enum_obj[elem=
 + pos_values].string.length,
6b2770bfd6f924 Jorge Lopez     2023-06-08  271  							       &str_value, &=
value_len);
6b2770bfd6f924 Jorge Lopez     2023-06-08  272 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  273  				if (ret)
6b2770bfd6f924 Jorge Lopez     2023-06-08  274  					return -EINVAL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  275 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  276  				/*
6b2770bfd6f924 Jorge Lopez     2023-06-08  277  				 * ignore strings when =
possible values size
6b2770bfd6f924 Jorge Lopez     2023-06-08  278  				 * is greater than MAX_=
VALUES_SIZE
6b2770bfd6f924 Jorge Lopez     2023-06-08  279  				 */
6b2770bfd6f924 Jorge Lopez     2023-06-08  280  				if (size < MAX_VALUES_S=
IZE)
c5288cda69ee2d Andy Shevchenko 2024-06-02  281  					strscpy(enum_data->pos=
sible_values[pos_values], str_value);
467d41638113b6 Jorge Lopez     2023-07-31  282 =20
467d41638113b6 Jorge Lopez     2023-07-31  283  				kfree(str_value);
467d41638113b6 Jorge Lopez     2023-07-31  284  				str_value =3D NULL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  285  			}
05c808362e808e Muhammad Bilal  2026-08-12  286  			if (size)
05c808362e808e Muhammad Bilal  2026-08-12 @287  				elem +=3D (size < MAX_V=
ALUES_SIZE ? size : MAX_VALUES_SIZE) - 1;
6b2770bfd6f924 Jorge Lopez     2023-06-08  288  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  289  		default:
6b2770bfd6f924 Jorge Lopez     2023-06-08  290  			pr_warn("Invalid element=
: %d found in Enumeration attribute or data may be malformed\n", elem);
6b2770bfd6f924 Jorge Lopez     2023-06-08  291  			break;
6b2770bfd6f924 Jorge Lopez     2023-06-08  292  		}
6b2770bfd6f924 Jorge Lopez     2023-06-08  293 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  294  		kfree(str_value);
467d41638113b6 Jorge Lopez     2023-07-31  295  		str_value =3D NULL;
6b2770bfd6f924 Jorge Lopez     2023-06-08  296  	}
6b2770bfd6f924 Jorge Lopez     2023-06-08  297 =20
6b2770bfd6f924 Jorge Lopez     2023-06-08  298  exit_enumeration_package:
6b2770bfd6f924 Jorge Lopez     2023-06-08  299  	kfree(str_value);
6b2770bfd6f924 Jorge Lopez     2023-06-08  300  	return 0;
6b2770bfd6f924 Jorge Lopez     2023-06-08  301  }
6b2770bfd6f924 Jorge Lopez     2023-06-08  302 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
