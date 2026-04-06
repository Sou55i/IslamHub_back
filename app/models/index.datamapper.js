import hadithDatamapper from "./hadith.datamapper.js";
import croyanceDatamapper from "./croyance.datamapper.js";
import dhikrDatamapper from "./dhikr.datamapper.js";
import douaaDatamapper from "./douaa.datamapper.js";


const db = {
    hadith: hadithDatamapper,
    croyance: croyanceDatamapper,
    dhikr: dhikrDatamapper,
    douaa: douaaDatamapper,
};



export default db;