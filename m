Content-Type: multipart/mixed; boundary="===============7210699789460484856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4621/10468] kernel/trace/trace_events_user.c:324 user_event_parse_field() error: uninitialized symbol 'name'.
Date: Fri, 04 Mar 2022 13:41:35 +0800
Message-ID: <202203041339.VYBOQiwV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7210699789460484856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Beau Belgrave <beaub@linux.microsoft.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: 7f5a08c79df35e68f1a43033450c5050f12bc155 [4621/10468] user_events: =
Add minimal support for trace_event into ftrace
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: s390-randconfig-m031-20220304 (https://download.01.org/0day-ci/arch=
ive/20220304/202203041339.VYBOQiwV-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/trace/trace_events_user.c:324 user_event_parse_field() error: uninit=
ialized symbol 'name'.
kernel/trace/trace_events_user.c:915 user_events_ioctl_reg() warn: ignoring=
 unreachable code.

vim +/name +324 kernel/trace/trace_events_user.c

7f5a08c79df35e Beau Belgrave 2022-01-18  234  =

7f5a08c79df35e Beau Belgrave 2022-01-18  235  /*
7f5a08c79df35e Beau Belgrave 2022-01-18  236   * Parses the values of a fie=
ld within the description
7f5a08c79df35e Beau Belgrave 2022-01-18  237   * Format: type name [size]
7f5a08c79df35e Beau Belgrave 2022-01-18  238   */
7f5a08c79df35e Beau Belgrave 2022-01-18  239  static int user_event_parse_f=
ield(char *field, struct user_event *user,
7f5a08c79df35e Beau Belgrave 2022-01-18  240  				  u32 *offset)
7f5a08c79df35e Beau Belgrave 2022-01-18  241  {
7f5a08c79df35e Beau Belgrave 2022-01-18  242  	char *part, *type, *name;
7f5a08c79df35e Beau Belgrave 2022-01-18  243  	u32 depth =3D 0, saved_offse=
t =3D *offset;
7f5a08c79df35e Beau Belgrave 2022-01-18  244  	int len, size =3D -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  245  	bool is_struct =3D false;
7f5a08c79df35e Beau Belgrave 2022-01-18  246  =

7f5a08c79df35e Beau Belgrave 2022-01-18  247  	field =3D skip_spaces(field);
7f5a08c79df35e Beau Belgrave 2022-01-18  248  =

7f5a08c79df35e Beau Belgrave 2022-01-18  249  	if (*field =3D=3D '\0')
7f5a08c79df35e Beau Belgrave 2022-01-18  250  		return 0;
7f5a08c79df35e Beau Belgrave 2022-01-18  251  =

7f5a08c79df35e Beau Belgrave 2022-01-18  252  	/* Handle types that have a =
space within */
7f5a08c79df35e Beau Belgrave 2022-01-18  253  	len =3D str_has_prefix(field=
, "unsigned ");
7f5a08c79df35e Beau Belgrave 2022-01-18  254  	if (len)
7f5a08c79df35e Beau Belgrave 2022-01-18  255  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  256  =

7f5a08c79df35e Beau Belgrave 2022-01-18  257  	len =3D str_has_prefix(field=
, "struct ");
7f5a08c79df35e Beau Belgrave 2022-01-18  258  	if (len) {
7f5a08c79df35e Beau Belgrave 2022-01-18  259  		is_struct =3D true;
7f5a08c79df35e Beau Belgrave 2022-01-18  260  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  261  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  262  =

7f5a08c79df35e Beau Belgrave 2022-01-18  263  	len =3D str_has_prefix(field=
, "__data_loc unsigned ");
7f5a08c79df35e Beau Belgrave 2022-01-18  264  	if (len)
7f5a08c79df35e Beau Belgrave 2022-01-18  265  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  266  =

7f5a08c79df35e Beau Belgrave 2022-01-18  267  	len =3D str_has_prefix(field=
, "__data_loc ");
7f5a08c79df35e Beau Belgrave 2022-01-18  268  	if (len)
7f5a08c79df35e Beau Belgrave 2022-01-18  269  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  270  =

7f5a08c79df35e Beau Belgrave 2022-01-18  271  	len =3D str_has_prefix(field=
, "__rel_loc unsigned ");
7f5a08c79df35e Beau Belgrave 2022-01-18  272  	if (len)
7f5a08c79df35e Beau Belgrave 2022-01-18  273  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  274  =

7f5a08c79df35e Beau Belgrave 2022-01-18  275  	len =3D str_has_prefix(field=
, "__rel_loc ");
7f5a08c79df35e Beau Belgrave 2022-01-18  276  	if (len)
7f5a08c79df35e Beau Belgrave 2022-01-18  277  		goto skip_next;
7f5a08c79df35e Beau Belgrave 2022-01-18  278  =

7f5a08c79df35e Beau Belgrave 2022-01-18  279  	goto parse;
7f5a08c79df35e Beau Belgrave 2022-01-18  280  skip_next:
7f5a08c79df35e Beau Belgrave 2022-01-18  281  	type =3D field;
7f5a08c79df35e Beau Belgrave 2022-01-18  282  	field =3D strpbrk(field + le=
n, " ");
7f5a08c79df35e Beau Belgrave 2022-01-18  283  =

7f5a08c79df35e Beau Belgrave 2022-01-18  284  	if (field =3D=3D NULL)
7f5a08c79df35e Beau Belgrave 2022-01-18  285  		return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  286  =

7f5a08c79df35e Beau Belgrave 2022-01-18  287  	*field++ =3D '\0';
7f5a08c79df35e Beau Belgrave 2022-01-18  288  	depth++;
7f5a08c79df35e Beau Belgrave 2022-01-18  289  parse:
7f5a08c79df35e Beau Belgrave 2022-01-18  290  	while ((part =3D strsep(&fie=
ld, " ")) !=3D NULL) {
7f5a08c79df35e Beau Belgrave 2022-01-18  291  		switch (depth++) {
7f5a08c79df35e Beau Belgrave 2022-01-18  292  		case FIELD_DEPTH_TYPE:
7f5a08c79df35e Beau Belgrave 2022-01-18  293  			type =3D part;
7f5a08c79df35e Beau Belgrave 2022-01-18  294  			break;
7f5a08c79df35e Beau Belgrave 2022-01-18  295  		case FIELD_DEPTH_NAME:
7f5a08c79df35e Beau Belgrave 2022-01-18  296  			name =3D part;
7f5a08c79df35e Beau Belgrave 2022-01-18  297  			break;
7f5a08c79df35e Beau Belgrave 2022-01-18  298  		case FIELD_DEPTH_SIZE:
7f5a08c79df35e Beau Belgrave 2022-01-18  299  			if (!is_struct)
7f5a08c79df35e Beau Belgrave 2022-01-18  300  				return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  301  =

7f5a08c79df35e Beau Belgrave 2022-01-18  302  			if (kstrtou32(part, 10, &s=
ize))
7f5a08c79df35e Beau Belgrave 2022-01-18  303  				return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  304  			break;
7f5a08c79df35e Beau Belgrave 2022-01-18  305  		default:
7f5a08c79df35e Beau Belgrave 2022-01-18  306  			return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  307  		}
7f5a08c79df35e Beau Belgrave 2022-01-18  308  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  309  =

7f5a08c79df35e Beau Belgrave 2022-01-18  310  	if (depth < FIELD_DEPTH_SIZE)
7f5a08c79df35e Beau Belgrave 2022-01-18  311  		return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  312  =

7f5a08c79df35e Beau Belgrave 2022-01-18  313  	if (depth =3D=3D FIELD_DEPTH=
_SIZE)
7f5a08c79df35e Beau Belgrave 2022-01-18  314  		size =3D user_field_size(ty=
pe);
7f5a08c79df35e Beau Belgrave 2022-01-18  315  =

7f5a08c79df35e Beau Belgrave 2022-01-18  316  	if (size =3D=3D 0)
7f5a08c79df35e Beau Belgrave 2022-01-18  317  		return -EINVAL;
7f5a08c79df35e Beau Belgrave 2022-01-18  318  =

7f5a08c79df35e Beau Belgrave 2022-01-18  319  	if (size < 0)
7f5a08c79df35e Beau Belgrave 2022-01-18  320  		return size;
7f5a08c79df35e Beau Belgrave 2022-01-18  321  =

7f5a08c79df35e Beau Belgrave 2022-01-18  322  	*offset =3D saved_offset + s=
ize;
7f5a08c79df35e Beau Belgrave 2022-01-18  323  =

7f5a08c79df35e Beau Belgrave 2022-01-18 @324  	return user_event_add_field(=
user, type, name, saved_offset, size,
7f5a08c79df35e Beau Belgrave 2022-01-18  325  				    type[0] !=3D 'u', FIL=
TER_OTHER);
7f5a08c79df35e Beau Belgrave 2022-01-18  326  }
7f5a08c79df35e Beau Belgrave 2022-01-18  327  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7210699789460484856==--

