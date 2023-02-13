Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526D8F58
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676301625; x=1707837625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cmt1PZZzml5n6wCZsA/PVyttbQt9nnn8Et2YAcpIQdI=;
  b=FZyC3u+3pwGzlW72fPwgtKZwrMUBfawxM7bJWXpunirkLon1NpEawd0s
   jFEPKkKtcuTzJIgQ5n13x6xrM9QDs7oU2JnPVIE7j0SgYV6xBdQIf3J9U
   JtiI4l09T+7A3O6WgKtzUWqC/GBOlvfsQfeiXZL6a9YW4pdem/vcrvOjf
   75+KRT9rQm36EX2GDswFXtvRxf1uzUEyGneDdfwvZCe6S9jI95E7HGIpI
   7fuOKPYqBsCiWRSvJcxzM3zXQuT4zHYHDxCm6VPA5CSwn3aPVP4NyaNq5
   o7l4rw2i4MoHIrSwgnG4p2OGyaV1uIbklNTvM7v2iAmP5UCVaHMkA6LXd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395522147"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="395522147"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 07:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="811628701"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="811628701"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Feb 2023 07:20:23 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRacw-0007om-2M;
	Mon, 13 Feb 2023 15:20:22 +0000
Date: Mon, 13 Feb 2023 23:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-drm-fix-rc7 11/20] lib/dynamic_debug.c:214:34: warning:
 Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs,
 dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]
Message-ID: <202302132305.MnLcR4Ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/dynamic_debug.c:214:34: warning: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git dd-drm-fix-rc7
head:   7fcd2e086b1200fb7e3df458bd9674ac4c3b4519
commit: 5da02c372b9a7cef6a56c3c315755295f3b89ce4 [11/20] dyndbg-API: specialize DYNDBG_CLASSMAP_(DEFINE|USE)
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5da02c372b9a7cef6a56c3c315755295f3b89ce4
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302132305.MnLcR4Ft-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   lib/dynamic_debug.c:1520:32: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                  ^
   lib/dynamic_debug.c:43:23: note: Variable declared here.
   extern struct _ddebug __stop___dyndbg[];
                         ^
   lib/dynamic_debug.c:1520:16: note: Array decayed to pointer here.
     .num_descs = __stop___dyndbg - __start___dyndbg,
                  ^
   lib/dynamic_debug.c:42:23: note: Variable declared here.
   extern struct _ddebug __start___dyndbg[];
                         ^
   lib/dynamic_debug.c:1520:34: note: Array decayed to pointer here.
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                    ^
   lib/dynamic_debug.c:1520:32: note: Subtracting pointers that point to different objects
     .num_descs = __stop___dyndbg - __start___dyndbg,
                                  ^
   lib/dynamic_debug.c:1521:42: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                            ^
   lib/dynamic_debug.c:45:32: note: Variable declared here.
   extern struct ddebug_class_map __stop___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1521:18: note: Array decayed to pointer here.
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                    ^
   lib/dynamic_debug.c:44:32: note: Variable declared here.
   extern struct ddebug_class_map __start___dyndbg_classes[];
                                  ^
   lib/dynamic_debug.c:1521:44: note: Array decayed to pointer here.
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                              ^
   lib/dynamic_debug.c:1521:42: note: Subtracting pointers that point to different objects
     .num_classes = __stop___dyndbg_classes - __start___dyndbg_classes,
                                            ^
   lib/dynamic_debug.c:1522:48: warning: Subtracting pointers that point to different objects [comparePointers]
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                  ^
   lib/dynamic_debug.c:47:33: note: Variable declared here.
   extern struct ddebug_class_user __stop___dyndbg_class_refs[];
                                   ^
   lib/dynamic_debug.c:1522:21: note: Array decayed to pointer here.
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                       ^
   lib/dynamic_debug.c:46:33: note: Variable declared here.
   extern struct ddebug_class_user __start___dyndbg_class_refs[];
                                   ^
   lib/dynamic_debug.c:1522:50: note: Array decayed to pointer here.
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                    ^
   lib/dynamic_debug.c:1522:48: note: Subtracting pointers that point to different objects
     .num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
                                                  ^
   lib/dynamic_debug.c:1099:60: warning: Parameter 'pos' can be declared as pointer to const [constParameter]
   static void *ddebug_proc_start(struct seq_file *m, loff_t *pos)
                                                              ^
   lib/dynamic_debug.c:1122:57: warning: Parameter 'p' can be declared as pointer to const [constParameter]
   static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
                                                           ^
>> lib/dynamic_debug.c:214:34: warning: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs [uninitvar]
      map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
                                    ^
   lib/dynamic_debug.c:209:21: note: Assuming condition is false
     if (query->module &&
                       ^
   lib/dynamic_debug.c:214:34: note: Uninitialized variables: dt.link, dt.ddebugs, dt.classes, dt.class_refs, dt.num_ddebugs, dt.num_classes, dt.num_class_refs
      map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
                                    ^
   lib/dynamic_debug.c:1460:11: warning: Uninitialized variable: dt->mod_name [uninitvar]
     if (dt->mod_name == mod_name) {
             ^
   lib/dynamic_debug.c:109:12: warning: Using argument fb that points at uninitialized variable flags [ctuuninitvar]
    char *p = fb->buf;
              ^
   lib/dynamic_debug.c:1177:27: note: Calling function ddebug_describe_flags, 2nd argument is uninitialized
        ddebug_describe_flags(dp->flags, &flags));
                             ^
   lib/dynamic_debug.c:109:12: note: Using argument fb
    char *p = fb->buf;
              ^

vim +214 lib/dynamic_debug.c

a4a2a427413e35 Jim Cromie      2022-09-04  186  
e9d376f0fa66bd Jason Baron     2009-02-05  187  /*
85f7f6c0edb841 Jim Cromie      2011-12-19  188   * Search the tables for _ddebug's which match the given `query' and
85f7f6c0edb841 Jim Cromie      2011-12-19  189   * apply the `flags' and `mask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie      2011-12-19  190   * callsites, normally the same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie      2011-12-19  191   * logs the changes.  Takes ddebug_lock.
e9d376f0fa66bd Jason Baron     2009-02-05  192   */
85f7f6c0edb841 Jim Cromie      2011-12-19  193  static int ddebug_change(const struct ddebug_query *query,
84da83a6ffc0b7 Jim Cromie      2020-07-19  194  			 struct flag_settings *modifiers)
e9d376f0fa66bd Jason Baron     2009-02-05  195  {
e9d376f0fa66bd Jason Baron     2009-02-05  196  	int i;
e9d376f0fa66bd Jason Baron     2009-02-05  197  	struct ddebug_table *dt;
e9d376f0fa66bd Jason Baron     2009-02-05  198  	unsigned int newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  199  	unsigned int nfound = 0;
bfa3ca448e8164 Jim Cromie      2022-09-04  200  	struct flagsbuf fbuf, nbuf;
a4a2a427413e35 Jim Cromie      2022-09-04  201  	struct ddebug_class_map *map = NULL;
a4a2a427413e35 Jim Cromie      2022-09-04  202  	int __outvar valid_class;
e9d376f0fa66bd Jason Baron     2009-02-05  203  
e9d376f0fa66bd Jason Baron     2009-02-05  204  	/* search for matching ddebugs */
e9d376f0fa66bd Jason Baron     2009-02-05  205  	mutex_lock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  206  	list_for_each_entry(dt, &ddebug_tables, link) {
e9d376f0fa66bd Jason Baron     2009-02-05  207  
e9d376f0fa66bd Jason Baron     2009-02-05  208  		/* match against the module name */
578b1e0701af34 Changbin Du     2014-01-23  209  		if (query->module &&
578b1e0701af34 Changbin Du     2014-01-23  210  		    !match_wildcard(query->module, dt->mod_name))
e9d376f0fa66bd Jason Baron     2009-02-05  211  			continue;
e9d376f0fa66bd Jason Baron     2009-02-05  212  
a4a2a427413e35 Jim Cromie      2022-09-04  213  		if (query->class_string) {
a4a2a427413e35 Jim Cromie      2022-09-04 @214  			map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
a4a2a427413e35 Jim Cromie      2022-09-04  215  			if (!map)
a4a2a427413e35 Jim Cromie      2022-09-04  216  				continue;
a4a2a427413e35 Jim Cromie      2022-09-04  217  		} else {
a4a2a427413e35 Jim Cromie      2022-09-04  218  			/* constrain query, do not touch class'd callsites */
a4a2a427413e35 Jim Cromie      2022-09-04  219  			valid_class = _DPRINTK_CLASS_DFLT;
a4a2a427413e35 Jim Cromie      2022-09-04  220  		}
a4a2a427413e35 Jim Cromie      2022-09-04  221  
e9d376f0fa66bd Jason Baron     2009-02-05  222  		for (i = 0; i < dt->num_ddebugs; i++) {
e9d376f0fa66bd Jason Baron     2009-02-05  223  			struct _ddebug *dp = &dt->ddebugs[i];
e9d376f0fa66bd Jason Baron     2009-02-05  224  
a4a2a427413e35 Jim Cromie      2022-09-04  225  			/* match site against query-class */
a4a2a427413e35 Jim Cromie      2022-09-04  226  			if (dp->class_id != valid_class)
a4a2a427413e35 Jim Cromie      2022-09-04  227  				continue;
a4a2a427413e35 Jim Cromie      2022-09-04  228  
e9d376f0fa66bd Jason Baron     2009-02-05  229  			/* match against the source filename */
d6a238d25014d0 Jim Cromie      2011-12-19  230  			if (query->filename &&
578b1e0701af34 Changbin Du     2014-01-23  231  			    !match_wildcard(query->filename, dp->filename) &&
578b1e0701af34 Changbin Du     2014-01-23  232  			    !match_wildcard(query->filename,
578b1e0701af34 Changbin Du     2014-01-23  233  					   kbasename(dp->filename)) &&
578b1e0701af34 Changbin Du     2014-01-23  234  			    !match_wildcard(query->filename,
578b1e0701af34 Changbin Du     2014-01-23  235  					   trim_prefix(dp->filename)))
e9d376f0fa66bd Jason Baron     2009-02-05  236  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  237  
e9d376f0fa66bd Jason Baron     2009-02-05  238  			/* match against the function */
d6a238d25014d0 Jim Cromie      2011-12-19  239  			if (query->function &&
578b1e0701af34 Changbin Du     2014-01-23  240  			    !match_wildcard(query->function, dp->function))
e9d376f0fa66bd Jason Baron     2009-02-05  241  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  242  
e9d376f0fa66bd Jason Baron     2009-02-05  243  			/* match against the format */
4b334484fa7f44 Jim Cromie      2020-07-19  244  			if (query->format) {
4b334484fa7f44 Jim Cromie      2020-07-19  245  				if (*query->format == '^') {
4b334484fa7f44 Jim Cromie      2020-07-19  246  					char *p;
4b334484fa7f44 Jim Cromie      2020-07-19  247  					/* anchored search. match must be at beginning */
4b334484fa7f44 Jim Cromie      2020-07-19  248  					p = strstr(dp->format, query->format+1);
4b334484fa7f44 Jim Cromie      2020-07-19  249  					if (p != dp->format)
4b334484fa7f44 Jim Cromie      2020-07-19  250  						continue;
4b334484fa7f44 Jim Cromie      2020-07-19  251  				} else if (!strstr(dp->format, query->format))
e9d376f0fa66bd Jason Baron     2009-02-05  252  					continue;
4b334484fa7f44 Jim Cromie      2020-07-19  253  			}
e9d376f0fa66bd Jason Baron     2009-02-05  254  
e9d376f0fa66bd Jason Baron     2009-02-05  255  			/* match against the line number range */
e9d376f0fa66bd Jason Baron     2009-02-05  256  			if (query->first_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  257  			    dp->lineno < query->first_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  258  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  259  			if (query->last_lineno &&
e9d376f0fa66bd Jason Baron     2009-02-05  260  			    dp->lineno > query->last_lineno)
e9d376f0fa66bd Jason Baron     2009-02-05  261  				continue;
e9d376f0fa66bd Jason Baron     2009-02-05  262  
e9d376f0fa66bd Jason Baron     2009-02-05  263  			nfound++;
e9d376f0fa66bd Jason Baron     2009-02-05  264  
84da83a6ffc0b7 Jim Cromie      2020-07-19  265  			newflags = (dp->flags & modifiers->mask) | modifiers->flags;
e9d376f0fa66bd Jason Baron     2009-02-05  266  			if (newflags == dp->flags)
e9d376f0fa66bd Jason Baron     2009-02-05  267  				continue;
e9666d10a5677a Masahiro Yamada 2018-12-31  268  #ifdef CONFIG_JUMP_LABEL
9049fc745300c5 Jason Baron     2016-08-03  269  			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
ee879be38bc87f Jim Cromie      2022-09-04  270  				if (!(newflags & _DPRINTK_FLAGS_PRINT))
9049fc745300c5 Jason Baron     2016-08-03  271  					static_branch_disable(&dp->key.dd_key_true);
ee879be38bc87f Jim Cromie      2022-09-04  272  			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
9049fc745300c5 Jason Baron     2016-08-03  273  				static_branch_enable(&dp->key.dd_key_true);
ee879be38bc87f Jim Cromie      2022-09-04  274  			}
9049fc745300c5 Jason Baron     2016-08-03  275  #endif
bfa3ca448e8164 Jim Cromie      2022-09-04  276  			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
2b6783191da721 Jim Cromie      2011-12-19  277  				  trim_prefix(dp->filename), dp->lineno,
e9d376f0fa66bd Jason Baron     2009-02-05  278  				  dt->mod_name, dp->function,
bfa3ca448e8164 Jim Cromie      2022-09-04  279  				  ddebug_describe_flags(dp->flags, &fbuf),
bfa3ca448e8164 Jim Cromie      2022-09-04  280  				  ddebug_describe_flags(newflags, &nbuf));
bfa3ca448e8164 Jim Cromie      2022-09-04  281  			dp->flags = newflags;
e9d376f0fa66bd Jason Baron     2009-02-05  282  		}
e9d376f0fa66bd Jason Baron     2009-02-05  283  	}
e9d376f0fa66bd Jason Baron     2009-02-05  284  	mutex_unlock(&ddebug_lock);
e9d376f0fa66bd Jason Baron     2009-02-05  285  
85f7f6c0edb841 Jim Cromie      2011-12-19  286  	return nfound;
e9d376f0fa66bd Jason Baron     2009-02-05  287  }
e9d376f0fa66bd Jason Baron     2009-02-05  288  

:::::: The code at line 214 was first introduced by commit
:::::: a4a2a427413e350bd01505f1f698b80545e1be58 dyndbg: validate class FOO by checking with module

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
