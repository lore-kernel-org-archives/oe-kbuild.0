Content-Type: multipart/mixed; boundary="===============7835887106598310479=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/cpu/cacheinfo.c:799:22: warning: Shifting signed 32-bit value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
Date: Wed, 20 Jul 2022 04:59:30 +0800
Message-ID: <202207200440.PohFoDhj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7835887106598310479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/x86/=
kernel/cpu/cacheinfo.c:799:22: warning: Shifting signed 32-bit value by 31 =
bits is implementation-defined behaviour [shiftTooManyBitsSigned]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ca85855bdcae8f84f1512e88b4c75009ea17ea2f
commit: 4b92d4add5f6dcf21275185c997d6ecb800054cd drivers: base: cacheinfo: =
Get rid of DEFINE_SMP_CALL_CACHE_FUNCTION()
date:   11 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 months ago
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4b92d4add5f6dcf21275185c997d6ecb800054cd
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/cpu/cacheinfo.c:799:22: warning: Shifting signed 32-bit =
value by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigne=
d]
       if (regs[j] & (1 << 31))
                        ^
>> arch/x86/kernel/cpu/cacheinfo.c:799:22: warning: Signed integer overflow=
 for expression '1<<31'. [integerOverflow]
       if (regs[j] & (1 << 31))
                        ^
>> arch/x86/kernel/cpu/cacheinfo.c:189:12: warning: union member 'l2_cache:=
:size_in_kb' is never used. [unusedStructMember]
     unsigned size_in_kb:16;
              ^
>> arch/x86/kernel/cpu/cacheinfo.c:199:12: warning: union member 'l3_cache:=
:res' is never used. [unusedStructMember]
     unsigned res:2;
              ^

vim +799 arch/x86/kernel/cpu/cacheinfo.c

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  731  =

f2d0d263b51d13 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-23  732  	if (c->cpuid_level > 3) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  733  		static int is_initialized;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  734  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  735  		if (is_initialized =3D=3D 0) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  736  			/* Init num_cache_leaves from boot CPU */
04a1541828ea22 arch/x86/kernel/cpu/intel_cacheinfo.c  Andreas Herrmann 2012=
-10-19  737  			num_cache_leaves =3D find_num_cache_leaves(c);
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  738  			is_initialized++;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  739  		}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  740  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  741  		/*
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  742  		 * Whenever possible use cpuid(4), deterministic cache
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  743  		 * parameters cpuid leaf to find the cache details
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  744  		 */
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  745  		for (i =3D 0; i < num_cache_leaves; i++) {
719038de98bc84 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2013=
-06-08  746  			struct _cpuid4_info_regs this_leaf =3D {};
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  747  			int retval;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  748  =

f9b90566cd46e1 arch/x86/kernel/cpu/intel_cacheinfo.c  Mike Travis      2009=
-01-10  749  			retval =3D cpuid4_cache_lookup_regs(i, &this_leaf);
719038de98bc84 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2013=
-06-08  750  			if (retval < 0)
719038de98bc84 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2013=
-06-08  751  				continue;
719038de98bc84 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2013=
-06-08  752  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  753  			switch (this_leaf.eax.split.level) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  754  			case 1:
0d55ba46bfbee6 arch/x86/kernel/cpu/intel_cacheinfo.c  Sudeep Holla     2015=
-03-04  755  				if (this_leaf.eax.split.type =3D=3D CTYPE_DATA)
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  756  					new_l1d =3D this_leaf.size/1024;
0d55ba46bfbee6 arch/x86/kernel/cpu/intel_cacheinfo.c  Sudeep Holla     2015=
-03-04  757  				else if (this_leaf.eax.split.type =3D=3D CTYPE_INST)
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  758  					new_l1i =3D this_leaf.size/1024;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  759  				break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  760  			case 2:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  761  				new_l2 =3D this_leaf.size/1024;
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  762  				num_threads_sharing =3D 1 + this_leaf.eax.split.num_thread=
s_sharing;
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  763  				index_msb =3D get_count_order(num_threads_sharing);
ddc5681ed33a27 arch/x86/kernel/cpu/intel_cacheinfo.c  Shai Fultheim    2012=
-04-20  764  				l2_id =3D c->apicid & ~((1 << index_msb) - 1);
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  765  				break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  766  			case 3:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  767  				new_l3 =3D this_leaf.size/1024;
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  768  				num_threads_sharing =3D 1 + this_leaf.eax.split.num_thread=
s_sharing;
719038de98bc84 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2013=
-06-08  769  				index_msb =3D get_count_order(num_threads_sharing);
ddc5681ed33a27 arch/x86/kernel/cpu/intel_cacheinfo.c  Shai Fultheim    2012=
-04-20  770  				l3_id =3D c->apicid & ~((1 << index_msb) - 1);
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  771  				break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  772  			default:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  773  				break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  774  			}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  775  		}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  776  	}
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  777  	/*
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  778  	 * Don't use cpuid2 if cpuid4 is supported. For P4, we use cp=
uid2 for
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  779  	 * trace cache
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  780  	 */
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  781  	if ((num_cache_leaves =3D=3D 0 || c->x86 =3D=3D 15) && c->cpu=
id_level > 1) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  782  		/* supports eax=3D2  call */
c1666e663d8443 arch/x86/kernel/cpu/intel_cacheinfo.c  Harvey Harrison  2008=
-01-31  783  		int j, n;
c1666e663d8443 arch/x86/kernel/cpu/intel_cacheinfo.c  Harvey Harrison  2008=
-01-31  784  		unsigned int regs[4];
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  785  		unsigned char *dp =3D (unsigned char *)regs;
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  786  		int only_trace =3D 0;
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  787  =

b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  788  		if (num_cache_leaves !=3D 0 && c->x86 =3D=3D 15)
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  789  			only_trace =3D 1;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  790  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  791  		/* Number of times to iterate */
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  792  		n =3D cpuid_eax(2) & 0xFF;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  793  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  794  		for (i =3D 0 ; i < n ; i++) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  795  			cpuid(2, &regs[0], &regs[1], &regs[2], &regs[3]);
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  796  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  797  			/* If bit 31 is set, this is an unknown format */
8bdbd962ecfcbd arch/x86/kernel/cpu/intel_cacheinfo.c  Alan Cox         2009=
-07-04  798  			for (j =3D 0 ; j < 3 ; j++)
8bdbd962ecfcbd arch/x86/kernel/cpu/intel_cacheinfo.c  Alan Cox         2009=
-07-04 @799  				if (regs[j] & (1 << 31))
8bdbd962ecfcbd arch/x86/kernel/cpu/intel_cacheinfo.c  Alan Cox         2009=
-07-04  800  					regs[j] =3D 0;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  801  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  802  			/* Byte 0 is level count, not a descriptor */
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  803  			for (j =3D 1 ; j < 16 ; j++) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  804  				unsigned char des =3D dp[j];
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  805  				unsigned char k =3D 0;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  806  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  807  				/* look up this descriptor in the table */
8bdbd962ecfcbd arch/x86/kernel/cpu/intel_cacheinfo.c  Alan Cox         2009=
-07-04  808  				while (cache_table[k].descriptor !=3D 0) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  809  					if (cache_table[k].descriptor =3D=3D des) {
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  810  						if (only_trace && cache_table[k].cache_type !=3D LVL_TRA=
CE)
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  811  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  812  						switch (cache_table[k].cache_type) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  813  						case LVL_1_INST:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  814  							l1i +=3D cache_table[k].size;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  815  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  816  						case LVL_1_DATA:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  817  							l1d +=3D cache_table[k].size;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  818  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  819  						case LVL_2:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  820  							l2 +=3D cache_table[k].size;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  821  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  822  						case LVL_3:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  823  							l3 +=3D cache_table[k].size;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  824  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  825  						case LVL_TRACE:
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  826  							trace +=3D cache_table[k].size;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  827  							break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  828  						}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  829  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  830  						break;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  831  					}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  832  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  833  					k++;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  834  				}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  835  			}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  836  		}
b06be912a3ad68 arch/i386/kernel/cpu/intel_cacheinfo.c Shaohua Li       2006=
-03-27  837  	}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  838  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  839  	if (new_l1d)
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  840  		l1d =3D new_l1d;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  841  =

^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  842  	if (new_l1i)
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  843  		l1i =3D new_l1i;
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  844  =

1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  845  	if (new_l2) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  846  		l2 =3D new_l2;
c8e56d20f2d190 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2015=
-06-04  847  #ifdef CONFIG_SMP
b6278470b7cdbf arch/x86/kernel/cpu/intel_cacheinfo.c  Mike Travis      2007=
-10-19  848  		per_cpu(cpu_llc_id, cpu) =3D l2_id;
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  849  #endif
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  850  	}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  851  =

1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  852  	if (new_l3) {
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  853  		l3 =3D new_l3;
c8e56d20f2d190 arch/x86/kernel/cpu/intel_cacheinfo.c  Borislav Petkov  2015=
-06-04  854  #ifdef CONFIG_SMP
b6278470b7cdbf arch/x86/kernel/cpu/intel_cacheinfo.c  Mike Travis      2007=
-10-19  855  		per_cpu(cpu_llc_id, cpu) =3D l3_id;
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  856  #endif
1e9f28fa1eb977 arch/i386/kernel/cpu/intel_cacheinfo.c Siddha, Suresh B 2006=
-03-27  857  	}
^1da177e4c3f41 arch/i386/kernel/cpu/intel_cacheinfo.c Linus Torvalds   2005=
-04-16  858  =


:::::: The code@line 799 was first introduced by commit
:::::: 8bdbd962ecfcbdd96f9dbb02d780b4553afd2543 x86/cpu: Clean up various f=
iles a bit

:::::: TO: Alan Cox <alan@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7835887106598310479==--

