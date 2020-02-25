-- This file is designed to have the necessary configuration

------------------------------------------------------------------------------------------------
DO $$DECLARE cnt INTEGER;
BEGIN
  SELECT COUNT(*) INTO cnt FROM system_user;
  IF cnt = 0 THEN
INSERT INTO system_user(email_id,name,domain_instance_name, role,status, status_dt, changed_by_email_id) VALUES ('testuser@ncsu.edu','Test User','system','administrator','active',now(),'testuser@ncsu.edu');
INSERT INTO system_user(email_id,name,domain_instance_name, role,status, status_dt,changed_by_email_id)  VALUES ('testuser@ncsu.edu','Test User','sandbox','adjudicator','active',now(),'testuser@ncsu.edu');
INSERT INTO system_user(email_id,name,domain_instance_name, role,status, status_dt,changed_by_email_id)  VALUES ('testuser@ncsu.edu','Test User','sandbox','administrator','active',now(),'testuser@ncsu.edu');
INSERT INTO system_user(email_id,name,domain_instance_name, role,status, status_dt, changed_by_email_id) VALUES ('testuser@ncsu.edu','Test User','sandbox','analyst','active',now(),'testuser@ncsu.edu');

INSERT INTO domain (domain_instance_name, domain_status, effective_ts, full_name, description, primary_contact,
                    appearance_order, user_email_id, insert_ts, configuration)
  VALUES ('system','active', now(),'System Configuration','System configuratin for OpenKE.','FirstName LastName', 1,
	  'testuser@ncsu.edu', now(),
'{'
'    "headerLinks": {"utilize": false, "hyperlinks": [] },'
'    "webapp": {'
'        "authorization": {'
'            "method": "singleuser",'
'            "signout_text": "SIGNOUT_TEXT",'
'            "http_header": ['
'                "x-forwarded-user",'
'                "remote_user"'
'            ],'
'            "signout_url": "SIGNOUT_URL",'
'            "oauth_clientid": "OAUTH_CLIENTID",'
'            "ldap": {'
'	             "dnFormat" : "uid=USERID,ou=accounts,dc=ncsu,dc=edu", '
'	             "emailDomain" : "ncsu.edu",'
'                "server": "ldaps://ldap.ncsu.edu:636"'
'            },'
'            "local" : {'
'               "minPasswordLength": 8,'
'               "maxPasswordLength": 200,'
'               "lowerCaseRequired": true,'
'               "upperCaseRequired": true,'
'               "digitRequired": true,'
'               "specialCharRequired": true,'
'               "maxPasswordAgeDays": 365,'
'               "maxFailures": 10'
'            }'
'        }'
'    },'
'    "geoTagAPI": "http://geo-service:9001/geoTagger/",'
'    "textrankAPI": "http://textrank-service:8000/textrank/",'
'    "whoisAPI": "http://whois-service:9001/whois/",'
'    "siteinfoAPI": "http://siteinfo-service:9001/siteinfo/",'
'    "nlpAPI": "http://nlp-service:9001/nlp/",'
'    "microformatAPI": "http://microformat-service:8000/microformat/",'
'    "dbpediaSpotlightAPI": "http://dbpedia-service:80/rest/annotate",'
'    "graphAPI": "http://graph-service:9001/GraphAPI/",'
'    "spacyAPI": "http://spacy-service:8000/spacy/",'
'    "temporalAPI": "http://temporal-service:9001/temporalTagger/v1/",'
'    "topicModelAPI": "http://topic-service:9001/topicmodel/",'
'    "wordnetAPI": {'
'                "specializedUrl": "http://wordnet-service:5679/hyponym/1/",'
'                "generalizedUrl": "http://wordnet-service:5679/hypernym/1/"'
'        },'
'    "import": {'
'        "sleepTimeSec": 300'
'    },'
'	  "userAgent": ['
'                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",'
'                "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:64.0) Gecko/20100101 Firefox/64.0",'
'                "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",'
'                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36",'
'                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",'
'                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_2) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0.2 Safari/605.1.15",'
'                "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36 Edge/17.17134",'
'                "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:64.0) Gecko/20100101 Firefox/64.0"'
'        ],'
'    "pastebinSearchURL": "https://www.googleapis.com/customsearch/v1element?key=AIzaSyCVAXiUzRYsML1Pv6RwSG1gunmMikTzQqY&rsz=filtered_cse&num=10&hl=en&prettyPrint=false&source=gcsc&gss=.com&sig=1ca94331d67f5f17586b15e6157d4d31&cx=013212718322258083429:lha4khxcshs&q=REPLACEME&safe=off&cse_tok=AF14hljQ5cJz6BG0BefkrXqjgqLH8f8bzQ:1537382351710&sort=&googlehost=www.google.com&oq=REPLACEME&gs_l=partner-generic.12..0.1561.6003.0.8528.17.13.4.0.0.0.100.935.12j1.13.0.gsnos%2Cn%3D13...0.4511j2416381j19j4..1ac.1.25.partner-generic..7.10.687.DX-_AbmIgHM&callback=google.search.Search.apiary19747&nocache=1537382353349",'
'    "allowDuplicateText": false,'
'    "collectionAccessRequired": false,'
'    "annotations": ['
'        "referrer", "http_headers", "structured_data", "html_title", "html_meta",'
'        "open_graph", "html_outlinks",  "provenance", "dataHeader",'
'        "language",  "tikaMetaData", "published_date", "concepts",'
'        "geotag", "microformat", "structuralExtraction", "spacy", "dbpedia"'
'    ],'
'    "sourceHandlers": [ "darkweb", "darkwebahmiasearch", "darkwebcabsearch", "darkwebmarket", "darkwebsearch", "DirectoryWatcher", "DomainDiscoveryHandler", "duckduckgo", "email", "faroo", "federatedAcademicSearch", "federatedSearch", "feed", "forum", "google", "googlescholar", "microsoftacademic", "pastebinsearch", "qwant", "vbulletin", "video", "web", "weblist" ],'
'    "adjudicationQuestions": {'
'        "utilize": false,'
'        "questions": [],'
'        "require": false,'
'        "title": "Job Adjudication: FIPP Questions",'
'        "overviewText": "Answering this series of questions will provide users with a brief overview of compliance and privacy considerations. Additionally, this process will ensure that appropriate authorities are well-thought-out; enabling the LAS to ensure it maintains the public trust."'
'    },'
'    "video": {'
'        "utilize": false,'
'        "url_regex": ['
'            "vimeo.com/[0-9]+",'
'            "youtu.be/\\w+",'
'            "www.youtube.com/watch\\?v=",'
'            "www.dailymotion.com/video/\\w+"'
'        ]'
'    },'
'    "newsFeed": {'
'        "urls": ['
'            "http://www.aljazeera.com/xml/rss/all.xml",'
'            "http://feeds.bbci.co.uk/news/world/rss.xml",'
'            "http://rss.nytimes.com/services/xml/rss/nyt/World.xml",'
'            "http://feeds.foxnews.com/foxnews/world"'
'        ],'
'        "keywords": [],'
'        "utilize": true,'
'        "cacheTimeMinutes": 10,'
'        "title": "News"'
'    },'
'    "systemComponent": {'
'        "accumulo": false,'
'        "kafka": false,'
'        "hdfs": false'
'    },'
'    "webCrawler": {'
'        "maxPagesToFetch": 10000,'
'        "politenessDelay": 500,'
'        "includeBinaryContentInCrawling": true,'
'        "maxDepthOfCrawling": -1,'
'        "userAgentString": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36",'
'        "respectRobotsTxt": true,'
'        "maxDownloadSize": 20000000'
'    },'
'    "conceptCacheSec": 1800,'
'    "conceptParse" : "document",'
'    "conceptTimeoutSec": 600,'
'    "accumulo": {'
'        "password": "ACCUMULO_PASSWORD",'
'        "instanceName": "ACCUMULO_INSTANCE_NAME",'
'        "zooKeepers": "ACCUMULO_ZOOKEEPERS",'
'        "userName": "ACCUMULO_USER_NAME",'
'        "storeRaw": {'
'            "normal": false,'
'            "sandbox": false,'
'            "archive": false'
'        }'
'    },'
'    "file": {'
'        "storeRaw": {'
'            "normal": true,'
'            "sandbox": true,'
'            "archive": false'
'        }'
'    },'
'    "ldap": {'
'    	"utilize" : false,'
'        "searchFields": ['
'            "displayName",'
'            "mail"'
'        ],'
'        "baseDN": "LDAP_BASE_DN",'
'        "url": "LDAP_URL"'
'    },'
'    "allowOnlineDomainPurge": false,'
'    "instrumentation": {'
'        "useSkylr": false,'
'        "useElastic": true,'
'        "elastic": { "settings": { "settings": { "index": {'
'                        "mapping": { "ignore_malformed": "true" },'
'                        "number_of_shards": 5,'
'                        "number_of_replicas": 1 } } },'
'            "mappings": {'
'                "properties": {'
'                    "data": {'
'                        "properties": {'
'                            "EvtTime": {'
'                                "type": "long",'
'                                "fields": {'
'                                    "converted": {'
'                                        "format": "strict_date_optional_time||epoch_millis",'
'                                        "type": "date"'
'                                    }'
'                                }'
'                            }'
'                        }'
'                    },'
'                    "time": {'
'                        "format": "strict_date_optional_time||epoch_millis",'
'                        "type": "date"'
'                    }'
'                }'
'            },'
'            "index": "skylr",'
'            "type": "events"'
'        },'
'        "api": "INSTRUMENTATION_API",'
'        "sendEvents": true,'
'        "projectID": "OpenKE/Collector",'
'        "token": "INSTRUMENTATION_TOKEN"'
'    },'
'    "kibana": {'
'        "utilizeDashboard": false,'
'        "homeTitle": "Top Pages Retrieved (all domains)",'
'        "homeDashboard": "KIBANA_HOME_DASHBOARD"'
'    },'
'    "export": {'
'        "maxRecordCount": 1000000,'
'        "voyant": {'
'            "postURL": "http://127.0.0.1:8080/voyant2/trombone",'
'            "accessURL": "/voyant/",'
'            "maxRecordCount": 1000'
'        },'
'        "timeToLiveHours": 25'
'    },'
'    "email": {'
'        "server": "EMAIL_SERVER",'
'        "password": "EMAIL_PASSWORD",'
'        "port": 587,'
'        "user": "EMAIL_USER"'
'    },'
'    "azure": {'
'        "academicAPI_key": "AZURE_ACADEMIC_API"'
'    },'
'    "kafka": {'
'        "replicationFactor": 1,'
'        "zookeeper": "KAFKA_ZOOKEEPER",'
'        "numPartitions": 5,'
'        "send": {'
'            "normal": true,'
'            "sandbox": false,'
'            "archive": false'
'        },'
'        "properties": {'
'            "compression.type": "snappy",'
'            "value.serializer": "org.apache.kafka.common.serialization.StringSerializer",'
'            "bootstrap.servers": "serverNameOrIP:6667",'
'            "key.serializer": "org.apache.kafka.common.serialization.StringSerializer"'
'        }'
'    },'
'    "elastic": {'
'        "default": {'
'            "settings": {'
'                "mapping": {'
'                    "total_fields": {'
'                        "limit": 3000'
'                    },'
'                    "ignore_malformed": "true"'
'                },'
'                "index": {'
'                    "number_of_shards": 5,'
'                    "number_of_replicas": 1'
'                }'
'            },'
'            "mappings": {'
'                    "properties": {'
'                        "domainDiscovery": {'
'                            "properties": {'
'                                "relevant": {'
'                                    "type": "boolean"'
'                                },'
'                                "retrievals": {'
'                                    "type": "nested",'
'                                    "properties": {'
'                                        "executionNumber": {'
'                                            "type": "long"'
'                                        },'
'                                        "sessionID": {'
'                                            "type": "text",'
'                                            "fields": {'
'                                                "raw": {'
'                                                    "index": true,'
'                                                    "type": "keyword"'
'                                                }'
'                                            }'
'                                        }'
'                                    }'
'                                },'
'                                "url": {'
'                                    "type": "text",'
'                                    "fields": {'
'                                        "raw": {'
'                                            "index": true,'
'                                            "type": "keyword"'
'                                        }'
'                                    }'
'                                }'
'                            }'
'                        },'
'                        "microformat": {'
'                            "type": "object",'
'                            "enabled": false'
'                        },'
'                        "html_meta": {'
'                            "type": "object",'
'                            "enabled": false'
'                        },'
'                        "url": {'
'                            "type": "text",'
'                            "fields": {'
'                                "raw": {'
'                                    "index": true,'
'                                    "type": "keyword"'
'                                }'
'                            }'
'                        },'
'                        "geotag": {'
'                            "type": "nested",'
'                            "properties": {'
'                                "geoData": {'
'                                    "properties": {'
'                                        "elevation": {'
'                                            "type": "long"'
'                                        },'
'                                        "geoNameID": {'
'                                            "type": "long"'
'                                        },'
'                                        "parentGeoNameID": {'
'                                            "type": "long"'
'                                        },'
'                                        "latitude": {'
'                                            "type": "float"'
'                                        },'
'                                        "longitude": {'
'                                            "type": "float"'
'                                        },'
'                                        "population": {'
'                                            "type": "long"'
'                                        }'
'                                    }'
'                                }'
'                            }'
'                        },'
'                        "open_graph": {'
'                            "type": "object",'
'                            "enabled": false'
'                        },'
'                        "provenance": {'
'                            "properties": {'
'                                "configuration": {'
'                                    "properties": {'
'                                        "allowSingleHopFromReferrer": {'
'                                            "type": "text"'
'                                        },'
'                                        "webCrawler": {'
'                                            "properties": {'
'                                                "respectRobotsTxt": {'
'                                                    "type": "text"'
'                                                }'
'                                            }'
'                                        }'
'                                    }'
'                                },'
'                                "job": {'
'                                    "properties": {'
'                                        "url": {'
'                                            "type": "text",'
'                                            "fields": {'
'                                                "raw": {'
'                                                    "index": true,'
'                                                    "type": "keyword"'
'                                                }'
'                                            }'
'                                        }'
'                                    }'
'                                }'
'                            }'
'                        },'
'                        "concepts": {'
'                            "type": "nested"'
'                        },'
'                        "http_headers": {'
'                            "type": "object",'
'                            "enabled": false'
'                        },'
'                        "user_collection": {'
'                            "type": "nested",'
'                            "properties": {'
'                                "collection_id": {'
'                                    "index": true,'
'                                    "type": "keyword"'
'                                }'
'                            }'
'                        },'
'                        "structured_data": {'
'                            "type": "object",'
'                            "enabled": false'
'                        },'
'                        "location": {'
'                            "type": "geo_point"'
'                        },'
'                        "tikaMetaData": {'
'                            "type": "object",'
'                            "enabled": false'
'                        }'
'                    }'
'                }'
'        },'
'        "restEndPoint": "http://elasticsearch:9200/",'
'        "storeJSON": {'
'            "normal": true,'
'            "sandbox": true,'
'            "archive": false'
'        }'
'    },'
'    "hdfs": {'
'        "hdfsUser": "HDFS_USER",'
'        "hdfsBaseURI": "HDFS_BASE_URI",'
'        "storeJSON": {'
'            "normal": false,'
'            "sandbox": false,'
'            "archive": false'
'        },'
'        "storeRaw": {'
'            "normal": false,'
'            "sandbox": false,'
'            "archive": false'
'        }'
'    },'
'    "faroo": {'
'        "key": "FAROO_KEY"'
'    },'
'    "applicationLogo": "resources/images/OSKE_logo.png",'
'    "hyperlinks": ['
'        {'
'            "displayText": "ElasticSearch: Cerebro",'
'            "link": "/cerebro/"'
'        },'
'        {'
'            "displayText": "Kibana",'
'            "link": "/kibana/app/kibana"'
'        },'
'        {'
'            "displayText": "Voyant",'
'            "link": "/voyant2/"'
'        }'
'    ],'
'    "accessAuthenticatedSites": false,'
'    "blockedTLDs": [ ],'
'}');

INSERT INTO domain (domain_instance_name, domain_status, effective_ts, full_name, description, primary_contact, appearance_order, user_email_id, insert_ts,configuration)
  VALUES ('sandbox','active', now(),'Sandbox','','FirstName LastName', 1, 'testuser@ncsu.edu', now(),'{}');

  END IF;
END$$;