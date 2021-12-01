Content-Type: multipart/mixed; boundary="===============5734140012051869464=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [axboe-block:perf-wip 26/26] kernel/trace/trace_events_synth.c:1888:8: warning: argument 2 null where non-null expected
Date: Thu, 02 Dec 2021 01:08:10 +0800
Message-ID: <202112020144.tPP70zqQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5734140012051869464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it perf-wip
head:   8c2996af4bcffbfbd06e9fe9cd5171cd07e5d5c4
commit: 8c2996af4bcffbfbd06e9fe9cd5171cd07e5d5c4 [26/26] x86: add modern In=
tel and AMD CPUs
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-c002-20211130 (https://download.01.org/0day-ci/ar=
chive/20211202/202112020144.tPP70zqQ-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block=
.git/commit/?id=3D8c2996af4bcffbfbd06e9fe9cd5171cd07e5d5c4
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/ker=
nel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block perf-wip
        git checkout 8c2996af4bcffbfbd06e9fe9cd5171cd07e5d5c4
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash kernel/tra=
ce/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In function '__synth_event_add_val',
       inlined from 'synth_event_add_next_val' at kernel/trace/trace_events=
_synth.c:1974:9:
>> kernel/trace/trace_events_synth.c:1888:8: warning: argument 2 null where=
 non-null expected [-Wnonnull]
    1888 |    if (strcmp(field->name, field_name) =3D=3D 0)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitmap.h:10,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:22,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from kernel/trace/trace_events_synth.c:8:
   kernel/trace/trace_events_synth.c: In function 'synth_event_add_next_val=
':
   include/linux/string.h:48:12: note: in a call to function 'strcmp' decla=
red here
      48 | extern int strcmp(const char *,const char *);
         |            ^~~~~~


vim +1888 kernel/trace/trace_events_synth.c

726721a51838e3 Tom Zanussi 2020-05-28  1852  =

726721a51838e3 Tom Zanussi 2020-05-28  1853  static int __synth_event_add_v=
al(const char *field_name, u64 val,
726721a51838e3 Tom Zanussi 2020-05-28  1854  				 struct synth_event_trace_=
state *trace_state)
726721a51838e3 Tom Zanussi 2020-05-28  1855  {
726721a51838e3 Tom Zanussi 2020-05-28  1856  	struct synth_field *field =3D=
 NULL;
726721a51838e3 Tom Zanussi 2020-05-28  1857  	struct synth_trace_event *ent=
ry;
726721a51838e3 Tom Zanussi 2020-05-28  1858  	struct synth_event *event;
726721a51838e3 Tom Zanussi 2020-05-28  1859  	int i, ret =3D 0;
726721a51838e3 Tom Zanussi 2020-05-28  1860  =

726721a51838e3 Tom Zanussi 2020-05-28  1861  	if (!trace_state) {
726721a51838e3 Tom Zanussi 2020-05-28  1862  		ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1863  		goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1864  	}
726721a51838e3 Tom Zanussi 2020-05-28  1865  =

726721a51838e3 Tom Zanussi 2020-05-28  1866  	/* can't mix add_next_synth_v=
al() with add_synth_val() */
726721a51838e3 Tom Zanussi 2020-05-28  1867  	if (field_name) {
726721a51838e3 Tom Zanussi 2020-05-28  1868  		if (trace_state->add_next) {
726721a51838e3 Tom Zanussi 2020-05-28  1869  			ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1870  			goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1871  		}
726721a51838e3 Tom Zanussi 2020-05-28  1872  		trace_state->add_name =3D tr=
ue;
726721a51838e3 Tom Zanussi 2020-05-28  1873  	} else {
726721a51838e3 Tom Zanussi 2020-05-28  1874  		if (trace_state->add_name) {
726721a51838e3 Tom Zanussi 2020-05-28  1875  			ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1876  			goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1877  		}
726721a51838e3 Tom Zanussi 2020-05-28  1878  		trace_state->add_next =3D tr=
ue;
726721a51838e3 Tom Zanussi 2020-05-28  1879  	}
726721a51838e3 Tom Zanussi 2020-05-28  1880  =

726721a51838e3 Tom Zanussi 2020-05-28  1881  	if (trace_state->disabled)
726721a51838e3 Tom Zanussi 2020-05-28  1882  		goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1883  =

726721a51838e3 Tom Zanussi 2020-05-28  1884  	event =3D trace_state->event;
726721a51838e3 Tom Zanussi 2020-05-28  1885  	if (trace_state->add_name) {
726721a51838e3 Tom Zanussi 2020-05-28  1886  		for (i =3D 0; i < event->n_f=
ields; i++) {
726721a51838e3 Tom Zanussi 2020-05-28  1887  			field =3D event->fields[i];
726721a51838e3 Tom Zanussi 2020-05-28 @1888  			if (strcmp(field->name, fie=
ld_name) =3D=3D 0)
726721a51838e3 Tom Zanussi 2020-05-28  1889  				break;
726721a51838e3 Tom Zanussi 2020-05-28  1890  		}
726721a51838e3 Tom Zanussi 2020-05-28  1891  		if (!field) {
726721a51838e3 Tom Zanussi 2020-05-28  1892  			ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1893  			goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1894  		}
726721a51838e3 Tom Zanussi 2020-05-28  1895  	} else {
726721a51838e3 Tom Zanussi 2020-05-28  1896  		if (trace_state->cur_field >=
=3D event->n_fields) {
726721a51838e3 Tom Zanussi 2020-05-28  1897  			ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1898  			goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1899  		}
726721a51838e3 Tom Zanussi 2020-05-28  1900  		field =3D event->fields[trac=
e_state->cur_field++];
726721a51838e3 Tom Zanussi 2020-05-28  1901  	}
726721a51838e3 Tom Zanussi 2020-05-28  1902  =

726721a51838e3 Tom Zanussi 2020-05-28  1903  	entry =3D trace_state->entry;
726721a51838e3 Tom Zanussi 2020-05-28  1904  	if (field->is_string) {
726721a51838e3 Tom Zanussi 2020-05-28  1905  		char *str_val =3D (char *)(l=
ong)val;
726721a51838e3 Tom Zanussi 2020-05-28  1906  		char *str_field;
726721a51838e3 Tom Zanussi 2020-05-28  1907  =

bd82631d7ccdc8 Tom Zanussi 2020-10-04  1908  		if (field->is_dynamic) { /* =
add_val can't do dynamic strings */
bd82631d7ccdc8 Tom Zanussi 2020-10-04  1909  			ret =3D -EINVAL;
bd82631d7ccdc8 Tom Zanussi 2020-10-04  1910  			goto out;
bd82631d7ccdc8 Tom Zanussi 2020-10-04  1911  		}
bd82631d7ccdc8 Tom Zanussi 2020-10-04  1912  =

726721a51838e3 Tom Zanussi 2020-05-28  1913  		if (!str_val) {
726721a51838e3 Tom Zanussi 2020-05-28  1914  			ret =3D -EINVAL;
726721a51838e3 Tom Zanussi 2020-05-28  1915  			goto out;
726721a51838e3 Tom Zanussi 2020-05-28  1916  		}
726721a51838e3 Tom Zanussi 2020-05-28  1917  =

726721a51838e3 Tom Zanussi 2020-05-28  1918  		str_field =3D (char *)&entry=
->fields[field->offset];
726721a51838e3 Tom Zanussi 2020-05-28  1919  		strscpy(str_field, str_val, =
STR_VAR_LEN_MAX);
726721a51838e3 Tom Zanussi 2020-05-28  1920  	} else {
726721a51838e3 Tom Zanussi 2020-05-28  1921  		switch (field->size) {
726721a51838e3 Tom Zanussi 2020-05-28  1922  		case 1:
726721a51838e3 Tom Zanussi 2020-05-28  1923  			*(u8 *)&trace_state->entry-=
>fields[field->offset] =3D (u8)val;
726721a51838e3 Tom Zanussi 2020-05-28  1924  			break;
726721a51838e3 Tom Zanussi 2020-05-28  1925  =

726721a51838e3 Tom Zanussi 2020-05-28  1926  		case 2:
726721a51838e3 Tom Zanussi 2020-05-28  1927  			*(u16 *)&trace_state->entry=
->fields[field->offset] =3D (u16)val;
726721a51838e3 Tom Zanussi 2020-05-28  1928  			break;
726721a51838e3 Tom Zanussi 2020-05-28  1929  =

726721a51838e3 Tom Zanussi 2020-05-28  1930  		case 4:
726721a51838e3 Tom Zanussi 2020-05-28  1931  			*(u32 *)&trace_state->entry=
->fields[field->offset] =3D (u32)val;
726721a51838e3 Tom Zanussi 2020-05-28  1932  			break;
726721a51838e3 Tom Zanussi 2020-05-28  1933  =

726721a51838e3 Tom Zanussi 2020-05-28  1934  		default:
726721a51838e3 Tom Zanussi 2020-05-28  1935  			trace_state->entry->fields[=
field->offset] =3D val;
726721a51838e3 Tom Zanussi 2020-05-28  1936  			break;
726721a51838e3 Tom Zanussi 2020-05-28  1937  		}
726721a51838e3 Tom Zanussi 2020-05-28  1938  	}
726721a51838e3 Tom Zanussi 2020-05-28  1939   out:
726721a51838e3 Tom Zanussi 2020-05-28  1940  	return ret;
726721a51838e3 Tom Zanussi 2020-05-28  1941  }
726721a51838e3 Tom Zanussi 2020-05-28  1942  =


:::::: The code at line 1888 was first introduced by commit
:::::: 726721a51838e3983023f906580722fc83f804ee tracing: Move synthetic eve=
nts to a separate file

:::::: TO: Tom Zanussi <zanussi@kernel.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5734140012051869464==--

