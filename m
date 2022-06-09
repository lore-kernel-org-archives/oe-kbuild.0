Content-Type: multipart/mixed; boundary="===============6205547595444634427=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1642/2142] arch/x86/events/core.c:2114 init_hw_perf_events() warn: missing error code 'err'
Date: Fri, 10 Jun 2022 04:17:45 +0800
Message-ID: <202206100456.HomFaAeW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6205547595444634427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: Like Xu <likexu@tencent.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ff539ac73ea559a8c146d99ab14bfcaddd30547a
commit: 916e3a4f950eac92c28cc138c10d86514ffebf98 [1642/2142] x86: events: D=
o not return bogus capabilities if PMU is broken
:::::: branch date: 16 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
610/202206100456.HomFaAeW-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/events/core.c:2114 init_hw_perf_events() warn: missing error code =
'err'

vim +/err +2114 arch/x86/events/core.c

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2078  =

dda99116969142 arch/x86/kernel/cpu/perf_event.c   Yinghai Lu             20=
11-01-21  2079  static int __init init_hw_perf_events(void)
b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2080  {
c1d6f42f1a42c7 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
11-12-06  2081  	struct x86_pmu_quirk *quirk;
72eae04d3a3075 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2082  	int err;
72eae04d3a3075 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2083  =

cdd6c482c9ff9c arch/x86/kernel/cpu/perf_event.c   Ingo Molnar            20=
09-09-21  2084  	pr_info("Performance Events: ");
1123e3ad73697d arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
09-05-29  2085  =

b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2086  	switch (boot_cpu_data.x86_vendor) {
b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2087  	case X86_VENDOR_INTEL:
72eae04d3a3075 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2088  		err =3D intel_pmu_init();
b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2089  		break;
f87ad35d37fa54 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2090  	case X86_VENDOR_AMD:
72eae04d3a3075 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2091  		err =3D amd_pmu_init();
f87ad35d37fa54 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2092  		break;
6d0ef316b9f8ea arch/x86/events/core.c             Pu Wen                 20=
18-09-23  2093  	case X86_VENDOR_HYGON:
6d0ef316b9f8ea arch/x86/events/core.c             Pu Wen                 20=
18-09-23  2094  		err =3D amd_pmu_init();
6d0ef316b9f8ea arch/x86/events/core.c             Pu Wen                 20=
18-09-23  2095  		x86_pmu.name =3D "HYGON";
6d0ef316b9f8ea arch/x86/events/core.c             Pu Wen                 20=
18-09-23  2096  		break;
3a4ac121c2cacb arch/x86/events/core.c             CodyYao-oc             20=
20-04-13  2097  	case X86_VENDOR_ZHAOXIN:
3a4ac121c2cacb arch/x86/events/core.c             CodyYao-oc             20=
20-04-13  2098  	case X86_VENDOR_CENTAUR:
3a4ac121c2cacb arch/x86/events/core.c             CodyYao-oc             20=
20-04-13  2099  		err =3D zhaoxin_pmu_init();
3a4ac121c2cacb arch/x86/events/core.c             CodyYao-oc             20=
20-04-13  2100  		break;
4138960a9251a2 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2101  	default:
8a3da6c7d0031f arch/x86/kernel/cpu/perf_event.c   Ingo Molnar            20=
13-09-28  2102  		err =3D -ENOTSUPP;
b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2103  	}
1123e3ad73697d arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
09-05-29  2104  	if (err !=3D 0) {
cdd6c482c9ff9c arch/x86/kernel/cpu/perf_event.c   Ingo Molnar            20=
09-09-21  2105  		pr_cont("no PMU driver, software events only.\n");
916e3a4f950eac arch/x86/events/core.c             Paolo Bonzini          20=
22-06-01  2106  		err =3D 0;
916e3a4f950eac arch/x86/events/core.c             Paolo Bonzini          20=
22-06-01  2107  		goto out_bad_pmu;
1123e3ad73697d arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
09-05-29  2108  	}
b56a3802dc6df2 arch/x86/kernel/cpu/perf_counter.c Jaswinder Singh Rajput 20=
09-02-27  2109  =

125580380f4180 arch/x86/kernel/cpu/perf_event.c   Cyrill Gorcunov        20=
09-12-10  2110  	pmu_check_apic();
125580380f4180 arch/x86/kernel/cpu/perf_event.c   Cyrill Gorcunov        20=
09-12-10  2111  =

33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c   Don Zickus             20=
10-11-22  2112  	/* sanity check that the hardware exists or is emulated */
fc4b8fca2d8fc8 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2113  	if (!check_hw_exists(&pmu, x86_pmu.num_counters, x86_pmu.n=
um_counters_fixed))
916e3a4f950eac arch/x86/events/core.c             Paolo Bonzini          20=
22-06-01 @2114  		goto out_bad_pmu;
33c6d6a7ad0ffa arch/x86/kernel/cpu/perf_event.c   Don Zickus             20=
10-11-22  2115  =

1123e3ad73697d arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
09-05-29  2116  	pr_cont("%s PMU driver.\n", x86_pmu.name);
faa28ae018ed00 arch/x86/kernel/cpu/perf_counter.c Robert Richter         20=
09-04-29  2117  =

e97df76377b8b3 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
14-02-05  2118  	x86_pmu.attr_rdpmc =3D 1; /* enable userspace RDPMC usage =
by default */
e97df76377b8b3 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
14-02-05  2119  =

c1d6f42f1a42c7 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
11-12-06  2120  	for (quirk =3D x86_pmu.quirks; quirk; quirk =3D quirk->nex=
t)
c1d6f42f1a42c7 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
11-12-06  2121  		quirk->func();
3c44780b220e87 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-03-04  2122  =

a1eac7ac903ea9 arch/x86/kernel/cpu/perf_event.c   Robert Richter         20=
12-06-20  2123  	if (!x86_pmu.intel_ctrl)
948b1bb89a4456 arch/x86/kernel/cpu/perf_event.c   Robert Richter         20=
10-03-29  2124  		x86_pmu.intel_ctrl =3D (1 << x86_pmu.num_counters) - 1;
241771ef016b5c arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
08-12-03  2125  =

cdd6c482c9ff9c arch/x86/kernel/cpu/perf_event.c   Ingo Molnar            20=
09-09-21  2126  	perf_events_lapic_init();
9c48f1c629ecfa arch/x86/kernel/cpu/perf_event.c   Don Zickus             20=
11-09-30  2127  	register_nmi_handler(NMI_LOCAL, perf_event_nmi_handler, 0,=
 "PMI");
1123e3ad73697d arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
09-05-29  2128  =

63b146490befc0 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-01-22  2129  	unconstrained =3D (struct event_constraint)
948b1bb89a4456 arch/x86/kernel/cpu/perf_event.c   Robert Richter         20=
10-03-29  2130  		__EVENT_CONSTRAINT(0, (1ULL << x86_pmu.num_counters) - 1,
9fac2cf316b070 arch/x86/kernel/cpu/perf_event.c   Stephane Eranian       20=
13-01-24  2131  				   0, x86_pmu.num_counters, 0, 0);
63b146490befc0 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-01-22  2132  =

641cc938815dfd arch/x86/kernel/cpu/perf_event.c   Jiri Olsa              20=
12-03-15  2133  	x86_pmu_format_group.attrs =3D x86_pmu.format_attrs;
0c9d42ed4cee2a arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
11-11-20  2134  =

a47473939db20e arch/x86/kernel/cpu/perf_event.c   Jiri Olsa              20=
12-10-10  2135  	if (!x86_pmu.events_sysfs_show)
a47473939db20e arch/x86/kernel/cpu/perf_event.c   Jiri Olsa              20=
12-10-10  2136  		x86_pmu_events_group.attrs =3D &empty_attrs;
a47473939db20e arch/x86/kernel/cpu/perf_event.c   Jiri Olsa              20=
12-10-10  2137  =

baa0c83363c7aa arch/x86/events/core.c             Jiri Olsa              20=
19-05-12  2138  	pmu.attr_update =3D x86_pmu.attr_update;
6089327f5424f2 arch/x86/events/core.c             Kan Liang              20=
17-05-12  2139  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2140  	if (!is_hybrid()) {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2141  		x86_pmu_show_pmu_cap(x86_pmu.num_counters,
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2142  				     x86_pmu.num_counters_fixed,
e11c1a7eb302ac arch/x86/events/core.c             Kan Liang              20=
21-04-12  2143  				     x86_pmu.intel_ctrl);
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2144  	}
3f6da390539882 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-03-05  2145  =

7c9903c9bf716d arch/x86/events/core.c             Peter Zijlstra         20=
20-08-18  2146  	if (!x86_pmu.read)
7c9903c9bf716d arch/x86/events/core.c             Peter Zijlstra         20=
20-08-18  2147  		x86_pmu.read =3D _x86_pmu_read;
7c9903c9bf716d arch/x86/events/core.c             Peter Zijlstra         20=
20-08-18  2148  =

abd562df94d19d arch/x86/events/core.c             Like Xu                20=
21-01-25  2149  	if (!x86_pmu.guest_get_msrs)
c8e2fe13d1d1f3 arch/x86/events/core.c             Sean Christopherson    20=
21-03-09  2150  		x86_pmu.guest_get_msrs =3D (void *)&__static_call_return0;
abd562df94d19d arch/x86/events/core.c             Like Xu                20=
21-01-25  2151  =

7c9903c9bf716d arch/x86/events/core.c             Peter Zijlstra         20=
20-08-18  2152  	x86_pmu_static_call_update();
7c9903c9bf716d arch/x86/events/core.c             Peter Zijlstra         20=
20-08-18  2153  =

95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2154  	/*
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2155  	 * Install callbacks. Core will call them for each online
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2156  	 * cpu.
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2157  	 */
73c1b41e63f040 arch/x86/events/core.c             Thomas Gleixner        20=
16-12-21  2158  	err =3D cpuhp_setup_state(CPUHP_PERF_X86_PREPARE, "perf/x8=
6:prepare",
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2159  				x86_pmu_prepare_cpu, x86_pmu_dead_cpu);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2160  	if (err)
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2161  		return err;
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2162  =

95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2163  	err =3D cpuhp_setup_state(CPUHP_AP_PERF_X86_STARTING,
73c1b41e63f040 arch/x86/events/core.c             Thomas Gleixner        20=
16-12-21  2164  				"perf/x86:starting", x86_pmu_starting_cpu,
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2165  				x86_pmu_dying_cpu);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2166  	if (err)
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2167  		goto out;
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2168  =

73c1b41e63f040 arch/x86/events/core.c             Thomas Gleixner        20=
16-12-21  2169  	err =3D cpuhp_setup_state(CPUHP_AP_PERF_X86_ONLINE, "perf/=
x86:online",
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2170  				x86_pmu_online_cpu, NULL);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2171  	if (err)
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2172  		goto out1;
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2173  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2174  	if (!is_hybrid()) {
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2175  		err =3D perf_pmu_register(&pmu, "cpu", PERF_TYPE_RAW);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2176  		if (err)
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2177  			goto out2;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2178  	} else {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2179  		u8 cpu_type =3D get_this_hybrid_cpu_type();
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2180  		struct x86_hybrid_pmu *hybrid_pmu;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2181  		int i, j;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2182  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2183  		if (!cpu_type && x86_pmu.get_hybrid_cpu_type)
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2184  			cpu_type =3D x86_pmu.get_hybrid_cpu_type();
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2185  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2186  		for (i =3D 0; i < x86_pmu.num_hybrid_pmus; i++) {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2187  			hybrid_pmu =3D &x86_pmu.hybrid_pmu[i];
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2188  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2189  			hybrid_pmu->pmu =3D pmu;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2190  			hybrid_pmu->pmu.type =3D -1;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2191  			hybrid_pmu->pmu.attr_update =3D x86_pmu.attr_update;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2192  			hybrid_pmu->pmu.capabilities |=3D PERF_PMU_CAP_HETEROGEN=
EOUS_CPUS;
55bcf6ef314ae8 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2193  			hybrid_pmu->pmu.capabilities |=3D PERF_PMU_CAP_EXTENDED_=
HW_TYPE;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2194  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2195  			err =3D perf_pmu_register(&hybrid_pmu->pmu, hybrid_pmu->=
name,
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2196  						(hybrid_pmu->cpu_type =3D=3D hybrid_big) ? PERF_TYPE_=
RAW : -1);
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2197  			if (err)
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2198  				break;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2199  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2200  			if (cpu_type =3D=3D hybrid_pmu->cpu_type)
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2201  				x86_pmu_update_cpu_context(&hybrid_pmu->pmu, raw_smp_pr=
ocessor_id());
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2202  		}
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2203  =

d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2204  		if (i < x86_pmu.num_hybrid_pmus) {
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2205  			for (j =3D 0; j < i; j++)
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2206  				perf_pmu_unregister(&x86_pmu.hybrid_pmu[j].pmu);
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2207  			pr_warn("Failed to register hybrid PMUs\n");
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2208  			kfree(x86_pmu.hybrid_pmu);
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2209  			x86_pmu.hybrid_pmu =3D NULL;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2210  			x86_pmu.num_hybrid_pmus =3D 0;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2211  			goto out2;
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2212  		}
d9977c43bff895 arch/x86/events/core.c             Kan Liang              20=
21-04-12  2213  	}
004417a6d468e2 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-11-25  2214  =

004417a6d468e2 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-11-25  2215  	return 0;
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2216  =

95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2217  out2:
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2218  	cpuhp_remove_state(CPUHP_AP_PERF_X86_ONLINE);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2219  out1:
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2220  	cpuhp_remove_state(CPUHP_AP_PERF_X86_STARTING);
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2221  out:
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2222  	cpuhp_remove_state(CPUHP_PERF_X86_PREPARE);
916e3a4f950eac arch/x86/events/core.c             Paolo Bonzini          20=
22-06-01  2223  out_bad_pmu:
916e3a4f950eac arch/x86/events/core.c             Paolo Bonzini          20=
22-06-01  2224  	memset(&x86_pmu, 0, sizeof(x86_pmu));
95ca792c7582fd arch/x86/events/core.c             Thomas Gleixner        20=
16-07-13  2225  	return err;
241771ef016b5c arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
08-12-03  2226  }
004417a6d468e2 arch/x86/kernel/cpu/perf_event.c   Peter Zijlstra         20=
10-11-25  2227  early_initcall(init_hw_perf_events);
621a01eac89b5e arch/x86/kernel/cpu/perf_counter.c Ingo Molnar            20=
08-12-11  2228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6205547595444634427==--

