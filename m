Content-Type: multipart/mixed; boundary="===============2311101690180938872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen:5.19/zen-sauce 7/29] kernel/trace/trace_events_synth.c:1897:29: warning: argument 2 null where non-null expected
Date: Sun, 07 Aug 2022 01:04:15 +0800
Message-ID: <202208070045.YVZV8QZC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2311101690180938872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "only Kconfig file updated"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.19/zen-sauce
head:   0da8625949ccf3b2d8b5633fbce842c6b5897fe3
commit: b53feb0ba5a8f3af0795778120a38bce6676179b [7/29] ZEN: Unrestrict CON=
FIG_OPTIMIZE_FOR_PERFORMANCE_O3
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: riscv-randconfig-r034-20220806 (https://download.01.org/0day-ci/arc=
hive/20220807/202208070045.YVZV8QZC-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/zen-kernel/zen-kernel/commit/b53feb0ba5a8f3af0=
795778120a38bce6676179b
        git remote add zen https://github.com/zen-kernel/zen-kernel
        git fetch --no-tags zen 5.19/zen-sauce
        git checkout b53feb0ba5a8f3af0795778120a38bce6676179b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Driscv SHELL=3D/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In function '__synth_event_add_val',
       inlined from 'synth_event_add_next_val' at kernel/trace/trace_events=
_synth.c:1983:9:
>> kernel/trace/trace_events_synth.c:1897:29: warning: argument 2 null wher=
e non-null expected [-Wnonnull]
    1897 |                         if (strcmp(field->name, field_name) =3D=
=3D 0)
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from kernel/trace/trace_events_synth.c:8:
   include/linux/string.h: In function 'synth_event_add_next_val':
   include/linux/string.h:48:12: note: in a call to function 'strcmp' decla=
red 'nonnull'
      48 | extern int strcmp(const char *,const char *);
         |            ^~~~~~


vim +1897 kernel/trace/trace_events_synth.c

726721a51838e398 Tom Zanussi 2020-05-28  1861  =

726721a51838e398 Tom Zanussi 2020-05-28  1862  static int __synth_event_add=
_val(const char *field_name, u64 val,
726721a51838e398 Tom Zanussi 2020-05-28  1863  				 struct synth_event_trac=
e_state *trace_state)
726721a51838e398 Tom Zanussi 2020-05-28  1864  {
726721a51838e398 Tom Zanussi 2020-05-28  1865  	struct synth_field *field =
=3D NULL;
726721a51838e398 Tom Zanussi 2020-05-28  1866  	struct synth_trace_event *e=
ntry;
726721a51838e398 Tom Zanussi 2020-05-28  1867  	struct synth_event *event;
726721a51838e398 Tom Zanussi 2020-05-28  1868  	int i, ret =3D 0;
726721a51838e398 Tom Zanussi 2020-05-28  1869  =

726721a51838e398 Tom Zanussi 2020-05-28  1870  	if (!trace_state) {
726721a51838e398 Tom Zanussi 2020-05-28  1871  		ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1872  		goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1873  	}
726721a51838e398 Tom Zanussi 2020-05-28  1874  =

726721a51838e398 Tom Zanussi 2020-05-28  1875  	/* can't mix add_next_synth=
_val() with add_synth_val() */
726721a51838e398 Tom Zanussi 2020-05-28  1876  	if (field_name) {
726721a51838e398 Tom Zanussi 2020-05-28  1877  		if (trace_state->add_next)=
 {
726721a51838e398 Tom Zanussi 2020-05-28  1878  			ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1879  			goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1880  		}
726721a51838e398 Tom Zanussi 2020-05-28  1881  		trace_state->add_name =3D =
true;
726721a51838e398 Tom Zanussi 2020-05-28  1882  	} else {
726721a51838e398 Tom Zanussi 2020-05-28  1883  		if (trace_state->add_name)=
 {
726721a51838e398 Tom Zanussi 2020-05-28  1884  			ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1885  			goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1886  		}
726721a51838e398 Tom Zanussi 2020-05-28  1887  		trace_state->add_next =3D =
true;
726721a51838e398 Tom Zanussi 2020-05-28  1888  	}
726721a51838e398 Tom Zanussi 2020-05-28  1889  =

726721a51838e398 Tom Zanussi 2020-05-28  1890  	if (trace_state->disabled)
726721a51838e398 Tom Zanussi 2020-05-28  1891  		goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1892  =

726721a51838e398 Tom Zanussi 2020-05-28  1893  	event =3D trace_state->even=
t;
726721a51838e398 Tom Zanussi 2020-05-28  1894  	if (trace_state->add_name) {
726721a51838e398 Tom Zanussi 2020-05-28  1895  		for (i =3D 0; i < event->n=
_fields; i++) {
726721a51838e398 Tom Zanussi 2020-05-28  1896  			field =3D event->fields[i=
];
726721a51838e398 Tom Zanussi 2020-05-28 @1897  			if (strcmp(field->name, f=
ield_name) =3D=3D 0)
726721a51838e398 Tom Zanussi 2020-05-28  1898  				break;
726721a51838e398 Tom Zanussi 2020-05-28  1899  		}
726721a51838e398 Tom Zanussi 2020-05-28  1900  		if (!field) {
726721a51838e398 Tom Zanussi 2020-05-28  1901  			ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1902  			goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1903  		}
726721a51838e398 Tom Zanussi 2020-05-28  1904  	} else {
726721a51838e398 Tom Zanussi 2020-05-28  1905  		if (trace_state->cur_field=
 >=3D event->n_fields) {
726721a51838e398 Tom Zanussi 2020-05-28  1906  			ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1907  			goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1908  		}
726721a51838e398 Tom Zanussi 2020-05-28  1909  		field =3D event->fields[tr=
ace_state->cur_field++];
726721a51838e398 Tom Zanussi 2020-05-28  1910  	}
726721a51838e398 Tom Zanussi 2020-05-28  1911  =

726721a51838e398 Tom Zanussi 2020-05-28  1912  	entry =3D trace_state->entr=
y;
726721a51838e398 Tom Zanussi 2020-05-28  1913  	if (field->is_string) {
726721a51838e398 Tom Zanussi 2020-05-28  1914  		char *str_val =3D (char *)=
(long)val;
726721a51838e398 Tom Zanussi 2020-05-28  1915  		char *str_field;
726721a51838e398 Tom Zanussi 2020-05-28  1916  =

bd82631d7ccdc894 Tom Zanussi 2020-10-04  1917  		if (field->is_dynamic) { /=
* add_val can't do dynamic strings */
bd82631d7ccdc894 Tom Zanussi 2020-10-04  1918  			ret =3D -EINVAL;
bd82631d7ccdc894 Tom Zanussi 2020-10-04  1919  			goto out;
bd82631d7ccdc894 Tom Zanussi 2020-10-04  1920  		}
bd82631d7ccdc894 Tom Zanussi 2020-10-04  1921  =

726721a51838e398 Tom Zanussi 2020-05-28  1922  		if (!str_val) {
726721a51838e398 Tom Zanussi 2020-05-28  1923  			ret =3D -EINVAL;
726721a51838e398 Tom Zanussi 2020-05-28  1924  			goto out;
726721a51838e398 Tom Zanussi 2020-05-28  1925  		}
726721a51838e398 Tom Zanussi 2020-05-28  1926  =

726721a51838e398 Tom Zanussi 2020-05-28  1927  		str_field =3D (char *)&ent=
ry->fields[field->offset];
726721a51838e398 Tom Zanussi 2020-05-28  1928  		strscpy(str_field, str_val=
, STR_VAR_LEN_MAX);
726721a51838e398 Tom Zanussi 2020-05-28  1929  	} else {
726721a51838e398 Tom Zanussi 2020-05-28  1930  		switch (field->size) {
726721a51838e398 Tom Zanussi 2020-05-28  1931  		case 1:
726721a51838e398 Tom Zanussi 2020-05-28  1932  			*(u8 *)&trace_state->entr=
y->fields[field->offset] =3D (u8)val;
726721a51838e398 Tom Zanussi 2020-05-28  1933  			break;
726721a51838e398 Tom Zanussi 2020-05-28  1934  =

726721a51838e398 Tom Zanussi 2020-05-28  1935  		case 2:
726721a51838e398 Tom Zanussi 2020-05-28  1936  			*(u16 *)&trace_state->ent=
ry->fields[field->offset] =3D (u16)val;
726721a51838e398 Tom Zanussi 2020-05-28  1937  			break;
726721a51838e398 Tom Zanussi 2020-05-28  1938  =

726721a51838e398 Tom Zanussi 2020-05-28  1939  		case 4:
726721a51838e398 Tom Zanussi 2020-05-28  1940  			*(u32 *)&trace_state->ent=
ry->fields[field->offset] =3D (u32)val;
726721a51838e398 Tom Zanussi 2020-05-28  1941  			break;
726721a51838e398 Tom Zanussi 2020-05-28  1942  =

726721a51838e398 Tom Zanussi 2020-05-28  1943  		default:
726721a51838e398 Tom Zanussi 2020-05-28  1944  			trace_state->entry->field=
s[field->offset] =3D val;
726721a51838e398 Tom Zanussi 2020-05-28  1945  			break;
726721a51838e398 Tom Zanussi 2020-05-28  1946  		}
726721a51838e398 Tom Zanussi 2020-05-28  1947  	}
726721a51838e398 Tom Zanussi 2020-05-28  1948   out:
726721a51838e398 Tom Zanussi 2020-05-28  1949  	return ret;
726721a51838e398 Tom Zanussi 2020-05-28  1950  }
726721a51838e398 Tom Zanussi 2020-05-28  1951  =


:::::: The code at line 1897 was first introduced by commit
:::::: 726721a51838e3983023f906580722fc83f804ee tracing: Move synthetic eve=
nts to a separate file

:::::: TO: Tom Zanussi <zanussi@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2311101690180938872==--

