Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A7E192
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Dec 2022 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671057451; x=1702593451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmjpbBSnHbyTO+thpLM30KWIYnm8/UPOLf/HqSE/UCk=;
  b=DiilVjebLxtwZ3mxNAHeB7Y8ztVHvTttq90vJKvvsIgVKuoQhzNexCHm
   ShVapF9da9u1GRC9lDkzsBaUqr1i/jA5NTzQiUBbl7rYATLR/QFEhgj6z
   4SC1FqqQKwkIJ2eywJoRo6sX3Mp3YSgQwLkTX5RopIxM/8KwURHMTsYnn
   Qod6rX2WmnaGXJjiyeRNEF8zliBRrnmWHHLW4edaD0/Yuh5jHSkVsxWEY
   y8YWUOmmnrd41sgmYNAPmfM6+gSMUC68qXzTWlABEn+RbcSq3U1nF6TxE
   K8JtI7Az33Fh0ArOgSOiKG5mHqY0i4dLvpQU//ON4f1Slq5EmqGUkupQR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="298872419"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="298872419"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2022 14:37:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="894494336"
X-IronPort-AV: E=Sophos;i="5.96,245,1665471600"; 
   d="scan'208";a="894494336"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Dec 2022 14:37:29 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p5aNU-0005rK-31;
	Wed, 14 Dec 2022 22:37:28 +0000
Date: Thu, 15 Dec 2022 06:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:hf-5d 10/20] lib/dynamic_debug.c:207:34: warning:
 Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs,
 dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]
Message-ID: <202212150609.GRTJb5Kk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/dynamic_debug.c:207:34: warning: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git hf-5d
head:   7901dbf81ac2dc78d3b266537ad44f3a2cbce2c7
commit: 3a3fbac5d7dc87fba9d82fdbf77121667590c578 [10/20] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
:::::: branch date: 15 hours ago
:::::: commit date: 16 hours ago
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3a3fbac5d7dc87fba9d82fdbf77121667590c578
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:1500:32: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                  ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1500:16: note: Array decayed to pointer here.
     .num_descs = __stop___dyndbg - __start___dyndbg,
                  ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1500:34: note: Array decayed to pointer here.
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                    ^
   lib/dynamic_debug.c:1500:32: note: Subtracting pointers that point to different objects
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                  ^
   lib/dynamic_debug.c:1501:42: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                            ^
   lib/dynamic_debug.c:45:32: note: Variable declared here.
   extern struct ddebug_class_map __stop___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1501:18: note: Array decayed to pointer here.
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                    ^
   lib/dynamic_debug.c:44:32: note: Variable declared here.
   extern struct ddebug_class_map __start___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1501:44: note: Array decayed to pointer here.
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                              ^
   lib/dynamic_debug.c:1501:42: note: Subtracting pointers that point to different objects
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                            ^
   lib/dynamic_debug.c:1502:48: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                  ^
   lib/dynamic_debug.c:47:33: note: Variable declared here.
   extern struct ddebug_class_user __stop___dyndbg_class_refs[];
                                   ^
   lib/dynamic_debug.c:1502:21: note: Array decayed to pointer here.
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                       ^
   lib/dynamic_debug.c:46:33: note: Variable declared here.
   extern struct ddebug_class_user __start___dyndbg_class_refs[];
                                   ^
   lib/dynamic_debug.c:1502:50: note: Array decayed to pointer here.
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                    ^
   lib/dynamic_debug.c:1502:48: note: Subtracting pointers that point to different objects
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                  ^
   lib/dynamic_debug.c:1079:60: warning: Parameter 'pos' can be declared as pointer to const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:1102:57: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
>> lib/dynamic_debug.c:207:34: warning: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]
      map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
                                    ^
   lib/dynamic_debug.c:202:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:207:34: note: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs
      map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
                                    ^
   lib/dynamic_debug.c:1440:11: warning: Uninitialized variable: dt->mod_name [uninitvar]
     if (dt->mod_name == mod_name) {
             ^
   lib/dynamic_debug.c:109:12: warning: Using argument fb that points at uninitialized variable flags [ctuuninitvar]
    char *p = fb->buf;
              ^
   lib/dynamic_debug.c:1158:27: note: Calling function ddebug_describe_flags, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:109:12: note: Using argument fb
    char *p = fb->buf;
              ^

vim +207 lib/dynamic_debug.c

a4a2a427413e35 Jim Cromie      2022-09-04  179  
e9d376f0fa66bd Jason Baron     2009-02-05  180  /*
85f7f6c0edb841 Jim Cromie      2011-12-19  181   * Search the tables for _ddebug's which match the given `query' and
85f7f6c0edb841 Jim Cromie      2011-12-19  182   * apply the `flags' and `mask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie      2011-12-19  183   * callsites, normally the same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie      2011-12-19  184   * logs the changes.  Takes ddebug_lock.
e9d376f0fa66bd Jason Baron     2009-02-05  185   */
85f7f6c0edb841 Jim Cromie      2011-12-19  186  static int ddebug_change(const struct ddebug_query *query,
84da83a6ffc0b7 Jim Cromie      2020-07-19  187  			 struct flag_settings *modifiers)
e9d376f0fa66bd Jason Baron     2009-02-05  188  {
e9d376f0fa66bd Jason Baron     2009-02-05  189  	int i;
e9d376f0fa66bd Jason Baron     2009-02-05  190  	struct ddebug_table *dt;
e9d376f0fa66bd Jason Baron     2009-02-05  191  	unsigned int newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  192  	unsigned int nfound = 0;
bfa3ca448e8164 Jim Cromie      2022-09-04  193  	struct flagsbuf fbuf, nbuf;
a4a2a427413e35 Jim Cromie      2022-09-04  194  	struct ddebug_class_map *map = NULL;
a4a2a427413e35 Jim Cromie      2022-09-04  195  	int __outvar valid_class;
e9d376f0fa66bd Jason Baron     2009-02-05  196  
e9d376f0fa66bd Jason Baron     2009-02-05  197  	/* search for matching ddebugs */
e9d376f0fa66bd Jason Baron     2009-02-05  198  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  199  	list_for_each_entry(dt, &ddebug_tables, link) {
e9d376f0fa66bd Jason Baron     2009-02-05  200  
e9d376f0fa66bd Jason Baron     2009-02-05  201  		/* match against the module name */
578b1e0701af34 Changbin Du     2014-01-23  202  		if (query->module &&
578b1e0701af34 Changbin Du     2014-01-23  203  		    !match_wildcard(query->module, dt->mod_name))
e9d376f0fa66bd Jason Baron     2009-02-05  204  			continue;
e9d376f0fa66bd Jason Baron     2009-02-05  205  
a4a2a427413e35 Jim Cromie      2022-09-04  206  		if (query->class_string) {
a4a2a427413e35 Jim Cromie      2022-09-04 @207  			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
a4a2a427413e35 Jim Cromie      2022-09-04  208  			if (!map)
a4a2a427413e35 Jim Cromie      2022-09-04  209  				continue;
a4a2a427413e35 Jim Cromie      2022-09-04  210  		} else {
a4a2a427413e35 Jim Cromie      2022-09-04  211  			/* constrain query, do not touch class'd callsites */
a4a2a427413e35 Jim Cromie      2022-09-04  212  			valid_class = _DPRINTK_CLASS_DFLT;
a4a2a427413e35 Jim Cromie      2022-09-04  213  		}
a4a2a427413e35 Jim Cromie      2022-09-04  214  
e9d376f0fa66bd Jason Baron     2009-02-05  215  		for (i = 0; i < dt->num_ddebugs; i++) {
e9d376f0fa66bd Jason Baron     2009-02-05  216  			struct _ddebug *dp = &dt->ddebugs[i];
e9d376f0fa66bd Jason Baron     2009-02-05  217  
a4a2a427413e35 Jim Cromie      2022-09-04  218  			/* match site against query-class */
a4a2a427413e35 Jim Cromie      2022-09-04  219  			if (dp->class_id != valid_class)
a4a2a427413e35 Jim Cromie      2022-09-04  220  				continue;
a4a2a427413e35 Jim Cromie      2022-09-04  221  
e9d376f0fa66bd Jason Baron     2009-02-05  222  			/* match against the source filename */
d6a238d25014d0 Jim Cromie      2011-12-19  223  			if (query->filename &&
578b1e0701af34 Changbin Du     2014-01-23  224  			    !match_wildcard(query->filename, dp->filename) &&
578b1e0701af34 Changbin Du     2014-01-23  225  			    !match_wildcard(query->filename,
578b1e0701af34 Changbin Du     2014-01-23  226  					   kbasename(dp->filename)) &&
578b1e0701af34 Changbin Du     2014-01-23  227  			    !match_wildcard(query->filename,
578b1e0701af34 Changbin Du     2014-01-23  228  					   trim_prefix(dp->filename)))
e9d376f0fa66bd Jason Baron     2009-02-05  229  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  230  
e9d376f0fa66bd Jason Baron     2009-02-05  231  			/* match against the function */
d6a238d25014d0 Jim Cromie      2011-12-19  232  			if (query->function &&
578b1e0701af34 Changbin Du     2014-01-23  233  			    !match_wildcard(query->function, dp->function))
e9d376f0fa66bd Jason Baron     2009-02-05  234  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  235  
e9d376f0fa66bd Jason Baron     2009-02-05  236  			/* match against the format */
4b334484fa7f44 Jim Cromie      2020-07-19  237  			if (query->format) {
4b334484fa7f44 Jim Cromie      2020-07-19  238  				if (*query->format == '^') {
4b334484fa7f44 Jim Cromie      2020-07-19  239  					char *p;
4b334484fa7f44 Jim Cromie      2020-07-19  240  					/* anchored search. match must be at beginning */
4b334484fa7f44 Jim Cromie      2020-07-19  241  					p = strstr(dp->format, query->format+1);
4b334484fa7f44 Jim Cromie      2020-07-19  242  					if (p != dp->format)
4b334484fa7f44 Jim Cromie      2020-07-19  243  						continue;
4b334484fa7f44 Jim Cromie      2020-07-19  244  				} else if (!strstr(dp->format, query->format))
e9d376f0fa66bd Jason Baron     2009-02-05  245  					continue;
4b334484fa7f44 Jim Cromie      2020-07-19  246  			}
e9d376f0fa66bd Jason Baron     2009-02-05  247  
e9d376f0fa66bd Jason Baron     2009-02-05  248  			/* match against the line number range */
e9d376f0fa66bd Jason Baron     2009-02-05  249  			if (query->first_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  250  			    dp->lineno < query->first_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  251  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  252  			if (query->last_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  253  			    dp->lineno > query->last_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  254  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  255  
e9d376f0fa66bd Jason Baron     2009-02-05  256  			nfound++;
e9d376f0fa66bd Jason Baron     2009-02-05  257  
84da83a6ffc0b7 Jim Cromie      2020-07-19  258  			newflags = (dp->flags & modifiers->mask) | modifiers->flags;
e9d376f0fa66bd Jason Baron     2009-02-05  259  			if (newflags == dp->flags)
e9d376f0fa66bd Jason Baron     2009-02-05  260  				continue;
e9666d10a5677a Masahiro Yamada 2018-12-31  261  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5 Jason Baron     2016-08-03  262  			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
ee879be38bc87f Jim Cromie      2022-09-04  263  				if (!(newflags & _DPRINTK_FLAGS_PRINT))
9049fc745300c5 Jason Baron     2016-08-03  264  					static_branch_disable(&dp->key.dd_key_true);
ee879be38bc87f Jim Cromie      2022-09-04  265  			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
9049fc745300c5 Jason Baron     2016-08-03  266  				static_branch_enable(&dp->key.dd_key_true);
ee879be38bc87f Jim Cromie      2022-09-04  267  			}
9049fc745300c5 Jason Baron     2016-08-03  268  #endif
bfa3ca448e8164 Jim Cromie      2022-09-04  269  			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
2b6783191da721 Jim Cromie      2011-12-19  270  				  trim_prefix(dp->filename), dp->lineno,
e9d376f0fa66bd Jason Baron     2009-02-05  271  				  dt->mod_name, dp->function,
bfa3ca448e8164 Jim Cromie      2022-09-04  272  				  ddebug_describe_flags(dp->flags, &fbuf),
bfa3ca448e8164 Jim Cromie      2022-09-04  273  				  ddebug_describe_flags(newflags, &nbuf));
bfa3ca448e8164 Jim Cromie      2022-09-04  274  			dp->flags = newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  275  		}
e9d376f0fa66bd Jason Baron     2009-02-05  276  	}
e9d376f0fa66bd Jason Baron     2009-02-05  277  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  278  
85f7f6c0edb841 Jim Cromie      2011-12-19  279  	return nfound;
e9d376f0fa66bd Jason Baron     2009-02-05  280  }
e9d376f0fa66bd Jason Baron     2009-02-05  281  

:::::: The code at line 207 was first introduced by commit
:::::: a4a2a427413e350bd01505f1f698b80545e1be58 dyndbg: validate class FOO by checking with module

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
